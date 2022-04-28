import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'dart:ui';

import '../../core/utils/color_constant.dart';

class AddName extends StatefulWidget {
  const AddName({Key? key}) : super(key: key);

  @override
  State<AddName> createState() => _AddNameState();
}

class _AddNameState extends State<AddName> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: AddNameHome(),);
  }

}

class AddNameHome extends StatefulWidget {
  const AddNameHome({ Key? key }) : super(key: key);

  @override
  State<AddNameHome> createState() => _AddNameHomeState();
}

class _AddNameHomeState extends State<AddNameHome> {
  


   final _formKey = GlobalKey<FormState>();
  String Name = "";
  bool? enabled  = true;
  SnackBar snackBar(String? title){ return SnackBar(
    content: Text(title!),
    duration: Duration(seconds: 6),
    );}

 
  
 
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
        title: Text(
          'Add a Name',
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
                
                
                hintText: "Enter Your name"),
          onChanged: (val) => Name = val,
          validator: (value) {
            if (value!.isEmpty) return "name cannot be empthy";
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
            onPressed: ()  async{  ;},
            icon: Icon(Icons.done_outline),
          )
        ],
      
    );
  }
}
