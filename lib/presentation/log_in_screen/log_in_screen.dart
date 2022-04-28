import 'package:david_s_application/presentation/admin_page_screen/admin_page_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../services/return_stream.dart';
import 'controller/log_in_controller.dart';
import 'package:david_s_application/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogInScreen extends GetWidget<LogInController> {
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPass = GlobalKey<FormState>();
   String email = "";
   String pass = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray200,
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Container(
                        margin: EdgeInsets.only(),
                        decoration: BoxDecoration(color: ColorConstant.gray200),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          top: getVerticalSize(19.00),
                                          bottom: getVerticalSize(20.00)),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        right:
                                                            getHorizontalSize(
                                                                10.00)),
                                                    child: Container(
                                                        height: getVerticalSize(
                                                            95.00),
                                                        width:
                                                            getHorizontalSize(
                                                                175.00),
                                                        child: SvgPicture.asset(
                                                            ImageConstant
                                                                .imgShape1,
                                                            fit:
                                                                BoxFit.fill)))),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            107.00),
                                                        top: getVerticalSize(
                                                            45.00),
                                                        right:
                                                            getHorizontalSize(
                                                                107.00)),
                                                    child: Text(
                                                        "lbl_welcome_back".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .textstylepoppinsbold18
                                                            .copyWith(
                                                                fontSize:
                                                                    getFontSize(
                                                                        18))))),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            55.00),
                                                        top: getVerticalSize(
                                                            15.00),
                                                        right:
                                                            getHorizontalSize(
                                                                55.00)),
                                                    child: Text(
                                                        "Let's help you manage the rooms!"
                                                            .tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: AppStyle
                                                            .textstylepoppinsregular13
                                                            .copyWith(
                                                                fontSize:
                                                                    getFontSize(
                                                                        13))))),
                                            Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            55.00),
                                                        top: getVerticalSize(
                                                            40.00),
                                                        right:
                                                            getHorizontalSize(
                                                                55.00)),
                                                    child: Container(
                                                        height: getVerticalSize(
                                                            199.96),
                                                        width:
                                                            getHorizontalSize(
                                                                237.00),
                                                        child: SvgPicture.asset(
                                                            ImageConstant
                                                                .imgUndrawwelcome,
                                                            fit:
                                                                BoxFit.fill)))),
                                           
                                          
                                            Form(
                                              key: _formKeyEmail,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(25.0),
                                                child: TextFormField(
                                                  onChanged: (value) => email = value,
                                                  validator: ((value) {
                                                    if(!value!.contains("@") & !value.contains(".")) 
                                                      return "please enter a valid email";
                                                    else return null;
                                                  }),
                                                  style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
                                                  decoration: InputDecoration(
                                                    hintText: "Enter your Ashesi email",
                                                    hintStyle: TextStyle(fontSize: 16, color: Colors.black45),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            borderSide: BorderSide(
                                                                width: 3.0,
                                                                color:
                                                                    ColorConstant
                                                                        .red200,
                                                                style:
                                                                    BorderStyle
                                                                        .solid)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            borderSide: BorderSide(
                                                                width: 3.0,
                                                                color:
                                                                    ColorConstant
                                                                        .red900,
                                                                style:
                                                                    BorderStyle
                                                                        .solid)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Form(
                                              key: _formKeyPass,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                                                child: TextFormField(
                                                  obscureText: true,
                                                  obscuringCharacter: "*",
                                                  onChanged: (value) => pass = value,
                                                  validator: ((value) {
                                                    if(value!.length< 6) 
                                                      return "password must be greater than 6 characters";
                                                    else return null;
                                                  }),
                                                  style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
                                                  decoration: InputDecoration(
                                                    
                                                    hintText: "Enter your password",
                                                    hintStyle: TextStyle(fontSize: 16, color: Colors.black45),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            borderSide: BorderSide(
                                                                width: 3.0,
                                                                color:
                                                                    ColorConstant
                                                                        .red200,
                                                                style:
                                                                    BorderStyle
                                                                        .solid)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            borderSide: BorderSide(
                                                                width: 3.0,
                                                                color:
                                                                    ColorConstant
                                                                        .red900,
                                                                style:
                                                                    BorderStyle
                                                                        .solid)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            25.00),
                                                        top: getVerticalSize(
                                                            27.00),
                                                        right: getHorizontalSize(
                                                            25.00)),
                                                    child: GestureDetector(
                                                        onTap: () async{
                                                          await Services.roomFetch();
                                                          onTapBtnLogin(context, email, pass);
                                                        },
                                                        child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            height:
                                                                getVerticalSize(
                                                                    58.00),
                                                            width: getHorizontalSize(
                                                                325.00),
                                                            decoration: AppDecoration
                                                                .textstylepoppinssemibold18,
                                                            child: Text(
                                                                "lbl_log_in".tr,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: AppStyle
                                                                    .textstylepoppinssemibold18
                                                                    .copyWith(
                                                                        fontSize:
                                                                            getFontSize(18)))))))
                                          ])))
                            ]))))));
  }

  onTapBtnLogin(BuildContext context, String email, pass) {
    if(_formKeyEmail.currentState!.validate() & _formKeyPass.currentState!.validate()){
      FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass).then((value){
           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>AdminPageScreen()));
      }).catchError((e){
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text("Error"),
            content: Text(e.message),
            actions: [
              TextButton(onPressed: ()=>Navigator.of(context).pop(), child: Text("Dismiss"))
            ],
          );
        });
      });
    }
  }
}
