import 'dart:convert';

import 'package:david_s_application/presentation/admin_page_screen/admin_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:back_pressed/back_pressed.dart';
import 'package:http/http.dart' as http;


import 'dart:ui';

import '../../core/utils/color_constant.dart';

class AddRoom extends StatefulWidget {
  const AddRoom({Key? key}) : super(key: key);

  @override
  State<AddRoom> createState() => _AddRoomState();
}

class _AddRoomState extends State<AddRoom> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: AddRoomHome(),);
  }

}

class AddRoomHome extends StatefulWidget {
  const AddRoomHome({ Key? key }) : super(key: key);

  @override
  State<AddRoomHome> createState() => _AddRoomHomeState();
}

class _AddRoomHomeState extends State<AddRoomHome> {
  


   final _formKey = GlobalKey<FormState>();
  String roomName = "";
  bool? enabled  = true;
  SnackBar snackBar(String? title){ return SnackBar(
    content: Text(title!),
    duration: Duration(seconds: 6),
    );}

 void _onFormSend(BuildContext context1)async{
    if(_formKey.currentState!.validate()){
      final url = "http://davidbrewu.atwebpages.com/swe_insert.php?roomName="+ roomName;
      final response = await http.post(Uri.parse(url), body: {
      });
      if (response.body == "success") {
        ScaffoldMessenger.of(context1).showSnackBar(snackBar(roomName +" added successfully"));
        //Navigator.of(context).pop();
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context1)=>AdminPageScreen()));
      }
      else {
         ScaffoldMessenger.of(context1).showSnackBar(snackBar("Failed to insert " + roomName + " please try again later"));
      }
    }
   
  }
 
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
        title: Text(
          'Add a Room',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        content: Form(
          key: _formKey,
            child: TextFormField(
              onTap: () => setState(() {
                enabled = true;
              }),
              
              
              decoration: InputDecoration(
               enabled: enabled!,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(width: 3.0, color: ColorConstant.red200, style: BorderStyle.solid)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(width: 3.0, color: ColorConstant.red200, style: BorderStyle.solid)
                ),
                hintStyle: TextStyle(color: Colors.black38),
                
                
                hintText: "Enter room name"),
          onChanged: (val) => roomName = val,
          validator: (value) {
            if (value!.isEmpty) return "room name cannot be empthy";
          },
        )),
        actions: [
          IconButton(
            color: Colors.red,
            iconSize: 30,
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.cancel_outlined),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.40,
          ),
          IconButton(
            iconSize: 30,
            color: Colors.green,
            onPressed: ()  async{  _onFormSend(context);},
            icon: Icon(Icons.done_outline),
          )
        ],
      
    );
  }
}
