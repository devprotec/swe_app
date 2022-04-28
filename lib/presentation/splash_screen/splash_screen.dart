import 'controller/splash_controller.dart';
import 'package:david_s_application/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends GetWidget<SplashController> {
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
                                                            25.00),
                                                        top: getVerticalSize(
                                                            137.00),
                                                        right:
                                                            getHorizontalSize(
                                                                25.00)),
                                                    child: Container(
                                                        height: getVerticalSize(
                                                            202.00),
                                                        width:
                                                            getHorizontalSize(
                                                                273.20),
                                                        child: SvgPicture.asset(
                                                            ImageConstant
                                                                .imgUndrawweather,
                                                            fit:
                                                                BoxFit.fill)))),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            56.00),
                                                        top: getVerticalSize(
                                                            17.00),
                                                        right:
                                                            getHorizontalSize(
                                                                56.00)),
                                                    child: Text(
                                                        "msg_air_monitoring".tr,
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
                                            // Align(
                                            //     alignment: Alignment.centerLeft,
                                            //     child: Container(
                                            //         width: getHorizontalSize(
                                            //             248.00),
                                            //         margin: EdgeInsets.only(
                                            //             left: getHorizontalSize(
                                            //                 48.00),
                                            //             top: getVerticalSize(
                                            //                 48.00),
                                            //             right:
                                            //                 getHorizontalSize(
                                            //                     48.00)),
                                            //         child: Text(
                                            //             "msg_lorem_ipsum_dol"
                                            //                 .tr,
                                            //             maxLines: null,
                                            //             textAlign:
                                            //                 TextAlign.center,
                                            //             style: AppStyle
                                            //                 .textstylepoppinsregular13
                                            //                 .copyWith(
                                            //                     fontSize:
                                            //                         getFontSize(
                                            //                             13))))),
                                            Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            25.00),
                                                        top: getVerticalSize(
                                                            43.00),
                                                        right: getHorizontalSize(
                                                            25.00)),
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          onTapBtnGetstarted();
                                                        },
                                                        child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            height:
                                                                getVerticalSize(
                                                                    58.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    325.00),
                                                            decoration: AppDecoration
                                                                .textstylepoppinssemibold18,
                                                            child: Text("lbl_get_started".tr,
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

  onTapBtnGetstarted() {
    Get.toNamed(AppRoutes.studentAdminChoiceScreen);
  }
}
