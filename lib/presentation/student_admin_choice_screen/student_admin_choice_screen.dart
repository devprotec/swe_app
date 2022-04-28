import 'package:david_s_application/presentation/admin_page_screen/admin_page_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'controller/student_admin_choice_controller.dart';
import 'package:david_s_application/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StudentAdminChoiceScreen extends GetWidget<StudentAdminChoiceController> {
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
                                                alignment: Alignment.center,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            24.00),
                                                        top: getVerticalSize(
                                                            6.00),
                                                        right:
                                                            getHorizontalSize(
                                                                24.00)),
                                                    child: Text(
                                                        "lbl_welcome".tr,
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
                                                            75.00),
                                                        top: getVerticalSize(
                                                            38.00),
                                                        right:
                                                            getHorizontalSize(
                                                                75.00)),
                                                    child: Container(
                                                        height: getVerticalSize(
                                                            199.60),
                                                        width:
                                                            getHorizontalSize(
                                                                191.61),
                                                        child: SvgPicture.asset(
                                                            ImageConstant
                                                                .imgUndrawchooser,
                                                            fit:
                                                                BoxFit.fill)))),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            148.00),
                                                        top: getVerticalSize(
                                                            23.40),
                                                        right:
                                                            getHorizontalSize(
                                                                148.00)),
                                                    child: Text(
                                                        "lbl_are_you_a".tr,
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
                                                alignment: Alignment.center,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            24.00),
                                                        top: getVerticalSize(
                                                            26.00),
                                                        right: getHorizontalSize(
                                                            24.00)),
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          onTapBtnUser();
                                                        },
                                                        child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            height:
                                                                getVerticalSize(
                                                                    50.00),
                                                            width: getHorizontalSize(
                                                                323.00),
                                                            decoration: AppDecoration
                                                                .textstylepoppinsregular131,
                                                            child: Text(
                                                                "lbl_user".tr,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: AppStyle
                                                                    .textstylepoppinsregular131
                                                                    .copyWith(
                                                                        fontSize:
                                                                            getFontSize(13))))))),
                                            Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            24.00),
                                                        top: getVerticalSize(
                                                            32.00),
                                                        right:
                                                            getHorizontalSize(
                                                                24.00)),
                                                    child: Text("lbl_or".tr,
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
                                                alignment: Alignment.center,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            24.00),
                                                        top: getVerticalSize(
                                                            19.00),
                                                        right: getHorizontalSize(
                                                            24.00)),
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          FirebaseAuth.instance.currentUser != null? onTapBtnAdminAuth():
                                                          onTapBtnAdmin();
                                                        },
                                                        child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            height:
                                                                getVerticalSize(
                                                                    50.00),
                                                            width: getHorizontalSize(
                                                                323.00),
                                                            decoration: AppDecoration
                                                                .textstylepoppinsregular131,
                                                            child: Text(
                                                                "lbl_admin".tr,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: AppStyle
                                                                    .textstylepoppinsregular131
                                                                    .copyWith(
                                                                        fontSize:
                                                                            getFontSize(13))))))),
                                            // Align(
                                            //     alignment: Alignment.center,
                                            //     child: Padding(
                                            //         padding: EdgeInsets.only(
                                            //             left: getHorizontalSize(
                                            //                 24.00),
                                            //             top: getVerticalSize(
                                            //                 27.00),
                                            //             right: getHorizontalSize(
                                            //                 24.00)),
                                            //         child: Container(
                                            //             alignment:
                                            //                 Alignment.center,
                                            //             height: getVerticalSize(
                                            //                 58.00),
                                            //             width:
                                            //                 getHorizontalSize(
                                            //                     325.00),
                                            //             decoration: AppDecoration
                                            //                 .textstylepoppinssemibold18,
                                            //             child: Text(
                                            //                 "lbl_continue".tr,
                                            //                 textAlign: TextAlign
                                            //                     .center,
                                            //                 style: AppStyle
                                            //                     .textstylepoppinssemibold18
                                            //                     .copyWith(
                                            //                         fontSize: getFontSize(18))))))
                                          ])))
                            ]))))));
  }

  onTapBtnUser() {
    Get.toNamed(AppRoutes.studentPageScreen);
  }

  onTapBtnAdmin() {
    Get.toNamed(AppRoutes.logInScreen);
  }
   onTapBtnAdminAuth() {
    Get.toNamed(AppRoutes.adminPageScreen);
  }
}
