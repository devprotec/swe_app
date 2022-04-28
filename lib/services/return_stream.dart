import 'dart:convert';

import '../main.dart';
import '../models/room_model.dart';
import 'package:http/http.dart' as http;

class Services{



  static Stream<List<String>> roomStream()async*{
     yield rooms;
  }


 static Stream<List<MapData>> roomFetch() async* {
      //dynamic token = await FlutterSession().get("data");
      final url = "http://davidbrewu.atwebpages.com/swe_retrieveRooms.php";
      List? data1;
      List<MapData>? data;
      final response = await http.post(Uri.parse(url), body: {
      });
      if (response.body == "Error") {
      }
      else {
         data1 = json.decode(response.body);
        data =  data1!.map((mapData)=>new MapData.fromJson(mapData)).toList();
      }
      yield data!;
        
      print(data1);
      //return data!;
      }


 static Future<List<MapData>> roomFuture() async {
      //dynamic token = await FlutterSession().get("data");
      final url = "http://davidbrewu.atwebpages.com/swe_retrieveRooms.php";
      List? data1;
      List<MapData>? data;
      final response = await http.post(Uri.parse(url), body: {
      });
      if (response.body == "Error") {
      }
      else {
         data1 = json.decode(response.body);
        data =  data1!.map((mapData)=>new MapData.fromJson(mapData)).toList();
      }
      //yield data!;
        
      print(data1!);
      return data!;
      }


      static Future <MapDataRoom> roomData(String roomName) async {
      //dynamic token = await FlutterSession().get("data");
      final url = "http://davidbrewu.atwebpages.com/rooms.php?roomName="+roomName+"future";
      List? data1;
      MapDataRoom? data;
      final response = await http.post(Uri.parse(url), body: {
      });
      if (response.body == "Error") {
      }
      else {
         data1 = json.decode(response.body);
        data =  data1!.map((mapData)=>new MapDataRoom.fromJson(mapData)).toList().last;
      }
      //yield data!;
        
      print(data1!.last);
      return data!;
      }
}
     