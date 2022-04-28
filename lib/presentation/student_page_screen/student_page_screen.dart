import 'package:david_s_application/main.dart';
import 'package:david_s_application/presentation/admin_page_screen/add_room.dart';
import 'package:david_s_application/presentation/default_lh_216_screen/default_lh_216_screen.dart';
import '../../models/room_model.dart';
import '../../services/return_stream.dart';
import '../admin_page_screen/controller/admin_page_controller.dart';
//import 'controller/admin_page_controller.dart';
import 'package:david_s_application/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StudentPageScreen extends GetWidget<AdminPageController> {
  var data1 = [];  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray200,
            body: Stack(children: [
              Positioned.fill(
                top: 340,
                child: StreamBuilder(
                initialData: roomData as dynamic,
                stream: Services.roomFetch(),
                builder: (context, snapshot) {
                   data1 = snapshot.data as dynamic;
                  return ListView.builder(
                      itemCount: data1.length,
                      itemBuilder: (context, index) {
                        return RoomBuild(
                            data1[index]);
                      });
                }),
              ),
              Column(children: [
                Container(
                    decoration: BoxDecoration(color: ColorConstant.red900),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  //  left: getHorizontalSize(24.00),
                                  //   top: getVerticalSize(64.00),
                                  //   right: getHorizontalSize(24.00)
                                  ),
                              child: ClipRRect(
                                  //  borderRadius:
                                  //   BorderRadius.circular(getSize(60.00)),
                                  child: Image.asset(
                                      ImageConstant.imgRectangle4,
                                      height: getSize(240.00),
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.fill))),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: getHorizontalSize(24.00),
                                      top: getVerticalSize(24.00),
                                      right: getHorizontalSize(24.00),
                                      bottom: getVerticalSize(15.00)),
                                  child: Text("Welcome Back!".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.textstylepoppinsbold181
                                          .copyWith(
                                              fontSize: getFontSize(18)))))
                        ])),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: getHorizontalSize(24.00),
                            top: getHorizontalSize(24.00),
                            right: getHorizontalSize(24.00)),
                        child: Text("Here's a list of supported rooms:".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylepoppinsbold18
                                .copyWith(fontSize: getFontSize(18))))),
              ]),
            ])));
  }

  onTapBtnLh216() {
    Get.toNamed(AppRoutes.adminLh216Screen);
  }

  onTapBtnGoback() {
    Get.toNamed(AppRoutes.studentAdminChoiceScreen);
  }
}

class RoomBuild extends StatelessWidget {
   final MapData model;
   // Future<Widget> function;
  RoomBuild(this.model);
  @override
  Widget build(BuildContext context) {
    return model.roomName == "DEFAULT"
        ? SizedBox.shrink()
        :Align(
        alignment: Alignment.centerRight,
        child: Padding(
            padding: EdgeInsets.only(
                left: getHorizontalSize(34.87),
                top: getVerticalSize(25.00),
                right: getHorizontalSize(34.87)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                      onTap: () async{
                       await Services.roomData(model.roomName!.tr).then((value) {
                           Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DefaultLh216Screen(value,model.roomName)));
                       });
                       
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: getVerticalSize(49.91),
                          width: getHorizontalSize(231.80),
                          decoration: AppDecoration.textstylepoppinssemibold161,
                          child: Text(model.roomName!.tr,
                              textAlign: TextAlign.center,
                              style: AppStyle.textstylepoppinssemibold161
                                  .copyWith(fontSize: getFontSize(16.69))))),
                ])));
  }
}

