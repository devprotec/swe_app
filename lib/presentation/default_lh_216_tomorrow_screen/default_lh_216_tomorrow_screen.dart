import 'package:david_s_application/models/room_model.dart';

import 'controller/default_lh_216_tomorrow_controller.dart';
import 'package:david_s_application/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultLh216TomorrowScreen
    extends GetWidget<DefaultLh216TomorrowController> {
      final String? roomName;
      final MapDataRoom? dataRoom;
      DefaultLh216TomorrowScreen(this.roomName, this.dataRoom);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.black9003f,
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Container(
                        margin: EdgeInsets.only(),
                        decoration:
                            BoxDecoration(color: ColorConstant.black9003f),
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
                                                child: Container(
                                                    height:
                                                        getVerticalSize(250.00),
                                                    width: size.width,
                                                    child: Stack(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        children: [
                                                          Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Container(
                                                                  height:
                                                                      getVerticalSize(
                                                                          250.00),
                                                                  width: size
                                                                      .width,
                                                                  decoration: BoxDecoration(
                                                                      color: ColorConstant
                                                                          .deepOrange900),
                                                                  child: Stack(
                                                                      children: [
                                                                        Align(
                                                                            alignment: Alignment
                                                                                .centerLeft,
                                                                            child: Image.asset(ImageConstant.imgRectangle4,
                                                                                height: getVerticalSize(250.00),
                                                                                width: getHorizontalSize(375.00),
                                                                                fit: BoxFit.fill))
                                                                      ]))),
                                                          Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              child: Padding(
                                                                  padding: EdgeInsets.only(
                                                                      right: getHorizontalSize(
                                                                          10.00),
                                                                      bottom: getVerticalSize(
                                                                          10.00)),
                                                                  child: Container(
                                                                      height: getVerticalSize(
                                                                          95.00),
                                                                      width: getHorizontalSize(
                                                                          175.00),
                                                                      child: SvgPicture.asset(
                                                                          ImageConstant
                                                                              .imgShape1,
                                                                          fit: BoxFit
                                                                              .fill))))
                                                        ]))),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            24.00),
                                                        top: getVerticalSize(
                                                            24.00),
                                                        right: getHorizontalSize(
                                                            24.00)),
                                                    child: Text(
                                                        roomName!
                                                            .tr+"'s Info Tomorrow",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .textstylepoppinsbold181
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
                                                            65.00),
                                                        right: getHorizontalSize(
                                                            24.00)),
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: getVerticalSize(
                                                            52.80),
                                                        width:
                                                            getHorizontalSize(
                                                                165.00),
                                                        decoration: AppDecoration
                                                            .textstylepoppinssemibold111,
                                                        child: Text(
                                                            "CO2: " + dataRoom!.cotwo!.tr + " ppm",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: AppStyle
                                                                .textstylepoppinssemibold111
                                                                .copyWith(
                                                                    fontSize: getFontSize(11.88)))))),
                                            Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            24.00),
                                                        top: getVerticalSize(
                                                            14.52),
                                                        right: getHorizontalSize(
                                                            24.00)),
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: getVerticalSize(
                                                            52.80),
                                                        width:
                                                            getHorizontalSize(
                                                                165.00),
                                                        decoration: AppDecoration
                                                            .textstylepoppinssemibold111,
                                                        child: Text("Methane: " + dataRoom!.methane!.tr + " ppm",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: AppStyle
                                                                .textstylepoppinssemibold111
                                                                .copyWith(
                                                                    fontSize:
                                                                        getFontSize(11.88)))))),
                                            Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            24.00),
                                                        top: getVerticalSize(
                                                            17.16),
                                                        right: getHorizontalSize(
                                                            24.00)),
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: getVerticalSize(
                                                            52.80),
                                                        width:
                                                            getHorizontalSize(
                                                                165.00),
                                                        decoration: AppDecoration
                                                            .textstylepoppinssemibold111,
                                                        child: Text("Temp: " + dataRoom!.temp!.tr + " *C",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: AppStyle
                                                                .textstylepoppinssemibold111
                                                                .copyWith(
                                                                    fontSize:
                                                                        getFontSize(11.88)))))),
                                            
                                                                             Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            24.00),
                                                        top: getVerticalSize(
                                                            17.16),
                                                        right: getHorizontalSize(
                                                            24.00)),
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: getVerticalSize(
                                                            52.80),
                                                        width:
                                                            getHorizontalSize(
                                                                165.00),
                                                        decoration: AppDecoration
                                                            .textstylepoppinssemibold111,
                                                        child: Text("SO2: " + dataRoom!.sotwo!.tr + " ppm",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: AppStyle
                                                                .textstylepoppinssemibold111
                                                                .copyWith(
                                                                    fontSize:
                                                                        getFontSize(11.88)))))),
                                                                         Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            24.00),
                                                        top: getVerticalSize(
                                                            17.16),
                                                        right: getHorizontalSize(
                                                            24.00)),
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: getVerticalSize(
                                                            52.80),
                                                        width:
                                                            getHorizontalSize(
                                                                165.00),
                                                        decoration: AppDecoration
                                                            .textstylepoppinssemibold111,
                                                        child: Text("CO: " + dataRoom!.co!.tr + " ppm",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: AppStyle
                                                                .textstylepoppinssemibold111
                                                                .copyWith(
                                                                    fontSize:
                                                                        getFontSize(11.88)))))),
                                          ])))
                            ]))))));
  }

  onTapBtnGoback() {
    Get.toNamed(AppRoutes.defaultLh216Screen);
  }
}
