import board
import adafruit_dht
import datetime
import psutil
from sds011 import *
import time
import busio
import adafruit_ads1x15.ads1015 as ADS
from adafruit_ads1x15.analog_in import AnalogIn
import urllib.parse
import urllib.request
import math
import json
import pandas as pd
import numpy as np
import tflite_runtime.interpreter as tflite
import aqi 
from gas_detection import GasDetection, P0, P1, P2
import warnings

warnings.filterwarnings("ignore")

def retrieveVar(variable):
    variable = str(variable)
    ffile=open('vars.txt','r').read()
    ini=ffile.find(variable)+(len(variable)+1)
    rest=ffile[ini:]
    search_enter=rest.find('\n')
    hold=rest[:search_enter]
    real_value = hold.split(' ')[1]

    return real_value

url_f = retrieveVar("url_f")
url_n = retrieveVar("url_n")
url_g = retrieveVar("url_g")
        
#######################
##                   ##
##  SDS011 - PM2.5   ##
##                   ##
#######################
try:
    sensor = SDS011("/dev/ttyUSB0", use_query_mode=True)
except IndexError:
    pm25 = 0

def get_data(n=3):
        sensor.sleep(sleep=False)
        pmt_2_5 = 0
        pmt_10 = 0
        time.sleep(10)
        for i in range (n):
            x = sensor.query()
            pmt_2_5 = pmt_2_5 + x[0]
            pmt_10 = pmt_10 + x[1]
            time.sleep(0.5)
        pmt_2_5 = round(pmt_2_5/n, 1)
        pmt_10 = round(pmt_10/n, 1)
        sensor.sleep(sleep=True)
        time.sleep(0.5)
        return pmt_2_5, pmt_10
    

def conv_aqi(pmt_2_5, pmt_10):
    aqi_2_5 = aqi.to_iaqi(aqi.POLLUTANT_PM25, str(pmt_2_5))
    aqi_10 = aqi.to_iaqi(aqi.POLLUTANT_PM10, str(pmt_10))
    return aqi_2_5, aqi_10


def save_log():        
    with open("/YOUR PATH/air_quality.csv", "a") as log:
        dt = datetime.now()
        log.write("{},{},{},{},{}\n".format(dt, pmt_2_5, aqi_2_5, pmt_10, aqi_10))
    log.close()


#######################
##                   ##
##      MQ2 - CO2    ##
##                   ##
#######################
detection = GasDetection(pin=P2)

ppm = detection.percentage()


#######################
##                   ##
##    MQ135 - SO2    ##
##                   ##
#######################
# Create the I2C bus
i2c = busio.I2C(board.SCL, board.SDA)

# Create the ADC object using the I2C bus
ads = ADS.ADS1015(i2c)
ads.gain = 1

# Create single-ended input on channel 0
chan = AnalogIn(ads, ADS.P0)

t = 22 # assume current temperature. Recommended to measure with DHT22
h = 65 # assume current humidity. Recommended to measure with DHT22

"""
First version of an RaspBerryPi Library for the MQ135 gas sensor
TODO: Review the correction factor calculation. This currently relies on
the datasheet but the information there seems to be wrong.
"""

# The load resistance on the board
RLOAD = 10.0
# Calibration resistance at atmospheric CO2 level
RZERO = 76.63
# Parameters for calculating ppm of CO2 from sensor resistance
PARA = 116.6020682
PARB = 2.769034857

# Parameters to model temperature and humidity dependence
CORA = 0.00035
CORB = 0.02718
CORC = 1.39538
CORD = 0.0018
CORE = -0.003333333
CORF = -0.001923077
CORG = 1.130128205

# Atmospheric CO2 level for calibration purposes
ATMOCO2 = 397.13

"""
@brief  Get the correction factor to correct for temperature and humidity
@param[in] t  The ambient air temperature
@param[in] h  The relative humidity
@return The calculated correction factor
"""

def getCorrectionFactor(t,h,CORA,CORB,CORC,CORD,CORE,CORF,CORG):
	# Linearization of the temperature dependency curve under and above 20 degree C
	# below 20degC: fact = a * t * t - b * t - (h - 33) * d
	# above 20degC: fact = a * t + b * h + c
	# this assumes a linear dependency on humidity
	if t < 20:
		return CORA * t * t - CORB * t + CORC - (h-33.)*CORD
	else:
		return CORE * t + CORF * h + CORG

"""
@brief  Get the resistance of the sensor, ie. the measurement value
@return The sensor resistance in kOhm
"""

def getResistance(value_pin,RLOAD):
	return ((1023./value_pin) - 1.)*RLOAD

"""
@brief  Get the resistance of the sensor, ie. the measurement value corrected
        for temp/hum
@param[in] t  The ambient air temperature
@param[in] h  The relative humidity
@return The corrected sensor resistance kOhm
"""

def getCorrectedResistance(t,h,CORA,CORB,CORC,CORD,CORE,CORF,CORG,value_pin,RLOAD):
	return getResistance(value_pin,RLOAD) / getCorrectionFactor(t,h,CORA,CORB,CORC,CORD,CORE,CORF,CORG)

"""
@brief  Get the ppm of CO2 sensed (assuming only CO2 in the air)
@return The ppm of CO2 in the air
"""

def getPPM(PARA,RZERO,PARB,value_pin,RLOAD):
	return PARA * math.pow((getResistance(value_pin,RLOAD)/RZERO), -PARB)

"""
@brief  Get the ppm of CO2 sensed (assuming only CO2 in the air), corrected
        for temp/hum
@param[in] t  The ambient air temperature
@param[in] h  The relative humidity
@return The ppm of CO2 in the air
"""

def getCorrectedPPM(t,h,CORA,CORB,CORC,CORD,CORE,CORF,CORG,value_pin,RLOAD,PARA,RZERO,PARB):
	return PARA * math.pow((getCorrectedResistance(t,h,CORA,CORB,CORC,CORD,CORE,CORF,CORG,value_pin,RLOAD)/RZERO), -PARB)

"""
@brief  Get the resistance RZero of the sensor for calibration purposes
@return The sensor resistance RZero in kOhm
"""

def getRZero(value_pin,RLOAD,ATMOCO2,PARA,PARB):
	return getResistance(value_pin,RLOAD) * math.pow((ATMOCO2/PARA), (1./PARB))

"""
@brief  Get the corrected resistance RZero of the sensor for calibration
        purposes
@param[in] t  The ambient air temperature
@param[in] h  The relative humidity
@return The corrected sensor resistance RZero in kOhm
"""

def getCorrectedRZero(t,h,CORA,CORB,CORC,CORD,CORE,CORF,CORG,value_pin,RLOAD,ATMOCO2,PARA,PARB):
	return getCorrectedResistance(t,h,CORA,CORB,CORC,CORD,CORE,CORF,CORG,value_pin,RLOAD) * math.pow((ATMOCO2/PARA), (1./PARB))

"""
Re-maps a number from one range to another. That is, a value of fromLow would get mapped to toLow, 
a value of fromHigh to toHigh, values in-between to values in-between, etc.
# Arduino: (0 a 1023)
# Raspberry Pi: (0 a 26690)
More Info: https://www.arduino.cc/reference/en/language/functions/math/map/
"""

def map(x,in_min,in_max,out_min,out_max):
	return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min

def printPPM():
	value_ads = chan.value # value obtained by ADS1115
	value_pin = map((value_ads - 565), 0, 26690, 0, 1023) # 565 / 535 fix value
	rzero = getRZero(value_pin,RLOAD,ATMOCO2,PARA,PARB)
	correctedRZero = getCorrectedRZero(t,h,CORA,CORB,CORC,CORD,CORE,CORF,CORG,value_pin,RLOAD,ATMOCO2,PARA,PARB)
	resistance = getResistance(value_pin,RLOAD)	
	ppm = getPPM(PARA,RZERO,PARB,value_pin,RLOAD)	
	correctedPPM = getCorrectedPPM(t,h,CORA,CORB,CORC,CORD,CORE,CORF,CORG,value_pin,RLOAD,PARA,RZERO,PARB)
	return ppm

#######################
##                   ##
##     MQ4 - CH4     ##
##                   ##
#######################
chan1 = AnalogIn(ads, ADS.P1)

Measure_RL = 20
MQ_Sample_Time = 5
Measure_RoInCleanAir = 4.4

class ADC1115_MQ4():
	def data_config(self):
		"""Select the Configuration Register data from the given provided values"""
		time.sleep(0.1)
		"""Read data back from ADC121C_MQ4_REG_CONVERSION(0x00), 2 bytes
		raw_adc MSB, raw_adc LSB"""
		data = chan1.value
		
		# Convert the data to 12-bits
		self.raw_adc = data
	
	def measure_rsAir(self):
		"""Calculate the sensor resistance in clean air from raw_adc"""
		vrl = self.raw_adc * (5.0 / 4096.0)
		self.rsAir = ((5.0 - vrl) / vrl) * Measure_RL
	
	def measure_Ro(self):
		"""Calculate Rs/Ro ratio from the resistance Rs & Ro"""
		Measure_Ro = 0.0
		for i in range(0, MQ_Sample_Time):
			Measure_Ro += self.rsAir
			time.sleep(0.1)
		Measure_Ro = Measure_Ro / MQ_Sample_Time
		Measure_Ro = Measure_Ro / Measure_RoInCleanAir
		return Measure_Ro
	
		
	def measure_Rs(self):
		Measure_Rs = 0.0
		for i in range(0, MQ_Sample_Time):
			Measure_Rs += self.rsAir
			time.sleep(0.1)
		Measure_Rs = Measure_Rs / MQ_Sample_Time
		return Measure_Rs
	
	def measure_ratio(self):
		self.ratio = self.measure_Rs() / self.measure_Ro()
	
	def calculate_ppm(self):
		"""Calculate the final concentration value"""
		a = -0.42
		b = 2.30
		ppm = math.exp(((math.log(self.ratio, 10)) - b) / a)
		
		return {'p' : ppm}

adc1115_mq4 = ADC1115_MQ4()

adc1115_mq4.data_config()
adc1115_mq4.measure_rsAir()
adc1115_mq4.measure_Rs()
adc1115_mq4.measure_Ro()
adc1115_mq4.measure_ratio()

#######################
##                   ##
##  DHT22 - Temp     ##
##                   ##
#######################
def temperature():
# Initial the dht device, with data pin connected to:
# dhtDevice = adafruit_dht.DHT11(board.D21)

        dhtDevice = adafruit_dht.DHT22(board.D21, use_pulseio=False)
    
        try:
            # Print the values to the serial port
                temperature_c = dhtDevice.temperature
        except RuntimeError as error:
                # Errors happen fairly often, DHT's are hard to read, just >
                temperature_c = ""
                print(error.args[0])
                time.sleep(2.0)
        except Exception as error:
                dhtDevice.exit()
                raise error
                temperature_c = ""
                time.sleep(2.0)
           
        return temperature_c




################################################
##                                            ##
##                                            ##
## RETRIEVING DATA FROM DATABASE              ##
## PERFROMING MACHINE LEARNING                ##
## SENDING PREDICTIONS TO DATABASE            ##
##                                            ##
##                                            ##
################################################

def fix_ml_input(ml_input):
    if ml_input == "no prediction":
        ml_input = np.zeros((24,), dtype='float32')
    elif ml_input.shape[0] < 24:
        pad_size = 24 - ml_input.shape[0] 
        ml_input = np.pad(ml_input, (pad_size,0),'constant')
    elif ml_input.shape[0] > 24:
        ml_input = ml_input[-24:]
        
    ml_input = np.reshape(ml_input, (24,1,1))
    
    return ml_input
    

##Open ML model
def run_ml(input_data):
    fut_val = 0
    if (np.mean(input_data)==0):
        return fut_val

    input_data = np.log(input_data)
    ml_int = tflite.Interpreter('model.tflite')
    ml_int.allocate_tensors()

    input_details = ml_int.get_input_details()
    output_details = ml_int.get_output_details()
    
    ml_int.set_tensor(input_details[0]['index'], input_data)
    ml_int.invoke()
    output_data = ml_int.get_tensor(output_details[0]['index'])
    results = np.expm1(output_data)
    results = np.squeeze(results)
    results = np.ma.masked_equal(results,0.95474577)
    fut_val = np.mean(results)

    if fut_val == 0:
        fut_val = ""

    return fut_val






        

################################################
##                                            ##
##                                            ##
## MAKING THE READINGS FROM THE SENSORS       ##
## AND SENDING TO DATABSE                     ##
## THEN MAKING PREDICTIONS EVERY 24 READINGS  ##
##                                            ##
##                                            ##
################################################
num_readings = 0
while True:
        temp = temperature()
        try:
            pmt_2_5, pmt_10 = get_data()
            aqi_2_5, aqi_10 = conv_aqi(pmt_2_5, pmt_10)
            pm25 = aqi_2_5
        except struct.error:
            pm25 = ""
        except AttributeError:
            pm25 = ""
        methane = adc1115_mq4.calculate_ppm()
        ch4 = methane['p']*10
        so2 = printPPM()
        co2 = ppm[detection.SMOKE_GAS]*20000
        
        print('Temp: {} °C\n'.format(temp)) 
        print('CO2: {} ppm\n'.format(co2))        
        print('PM2.5: {} ug/m3\n'.format(pm25))
        print('SO2: {} ppm\n'.format(so2))
        print('CH4: {} ppm\n'.format(ch4))
	
        values = {'temperature' : temp,
                  'methane' : ch4,
                  'sulphur': so2,
                  'pmreading': pm25,
                  'carbon': co2
                }
        
        data = urllib.parse.urlencode(values)
        data = data.encode('ascii') # data should be bytes
        req = urllib.request.Request(url_n, data)
        with urllib.request.urlopen(req) as response:
            the_page = response.read()
            print(the_page)
        num_readings += 1

        if(num_readings == 60):
            ##Retrieve data
            req = urllib.request.Request(url_g)
            with urllib.request.urlopen(req) as response:
                    data = response.read()
                    data = data.decode('ascii')
                    data = json.loads(data)
                    df = pd.DataFrame(data)
                    df = df.replace("",0,regex=True)
                    try:
                        methane = df['methane'].to_numpy(dtype='float32')
                    except ValueError:
                        methane = "no prediction"
                    try:
                        co2 = df['cotwo'].to_numpy(dtype='float32')
                    except ValueError:
                        co2 = "no prediction"
                    try:
                        temp = df['temp'].to_numpy(dtype='float32')
                    except ValueError:
                        temp = "no prediction"
                    try:
                        so2 = df['sotwo'].to_numpy(dtype='float32')
                    except ValueError:
                        so2 = "no prediction"
                    try:
                        pm25 = df['pm2.5'].to_numpy(dtype='float32')
                    except ValueError:
                        pm25 = "no prediction"


                        
            methane = fix_ml_input(methane)
            co2 = fix_ml_input(co2)
            temp = fix_ml_input(temp)
            so2 = fix_ml_input(so2)
            pm25 = fix_ml_input(pm25)

            ##Send predictions back
            fut_ch4 = run_ml(methane)*4
            fut_so2 = run_ml(so2)
            fut_pm25 = run_ml(pm25)
            fut_co2 = run_ml(co2)*4
            fut_temp = run_ml(temp)


            fut_values = {'temperature' : fut_temp,
                      'methane' : fut_ch4,
                      'sulphur': fut_so2,
                      'pmreading': fut_pm25,
                      'carbon': fut_co2
                    }

            print('Pred Temp: {} °C\n'.format(fut_temp)) 
            print('Pred CO2: {} ppm\n'.format(fut_co2))        
            print('Pred PM2.5: {} ug/m3\n'.format(fut_pm25))
            print('Pred SO2: {} ppm\n'.format(fut_so2))
            print('Pred CH4: {} ppm\n'.format(fut_ch4))


            fut_data = urllib.parse.urlencode(fut_values)
            fut_data = fut_data.encode('ascii') # data should be bytes
            req = urllib.request.Request(url_f, fut_data)
            with urllib.request.urlopen(req) as response:
                the_page = response.read()
                print(the_page)

            num_readings = 0
            





