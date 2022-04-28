import 'package:david_s_application/main.dart';
import 'package:david_s_application/presentation/admin_page_screen/add_room.dart';
import 'package:david_s_application/presentation/default_lh_216_screen/default_lh_216_screen.dart';
import 'package:david_s_application/presentation/student_admin_choice_screen/student_admin_choice_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/room_model.dart';
import '../../services/return_stream.dart';
import 'controller/admin_page_controller.dart';
import 'package:david_s_application/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

// class AdminPageScreen extends GetWidget<AdminPageController> {

// @override
// Widget build(BuildContext context){
//   return SafeArea(child: AdminPage());
// }

//}
class AdminPageScreen extends StatefulWidget {
  const AdminPageScreen({Key? key}) : super(key: key);

  @override
  State<AdminPageScreen> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPageScreen> {
  var data1 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.gray200,
        body: Stack(children: [
          Positioned.fill(
            top: 290,
            bottom: 100,
            child: StreamBuilder(
                initialData: roomData as dynamic,
                stream: Services.roomFetch(),
                builder: (context, snapshot) {
                  data1 = snapshot.data as dynamic;
                  return ListView.builder(
                      itemCount: data1.length,
                      itemBuilder: (context, index) {
                        return RoomBuild(data1[index]);
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: IconButton(
                                onPressed: () {
                                  FirebaseAuth.instance.signOut().then(
                                      (value) => Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(
                                              builder: (context) =>
                                                  StudentAdminChoiceScreen())));
                                },
                                icon: Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                  size: 25,
                                )),
                          ),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: getHorizontalSize(24.00),
                              top: getVerticalSize(5.00),
                              right: getHorizontalSize(24.00)),
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(55),
                              child: Image.asset(
                                  "assets/images/admin.jpg",
                                  height: getSize(120.00),
                                  width: getSize(120.00),
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
                                      .copyWith(fontSize: getFontSize(18))))),
                    ])),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: EdgeInsets.only(
                        left: getHorizontalSize(24.00),
                        top: getHorizontalSize(24.00),
                        right: getHorizontalSize(24.00)),
                    child: Text("msg_here_s_a_list_o".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.textstylepoppinsbold18
                            .copyWith(fontSize: getFontSize(18))))),
          ]),
          Positioned.fill(
            top: 600,
            child: Align(
                alignment: Alignment.center,
                child: Padding(
                    padding: EdgeInsets.only(
                        left: getHorizontalSize(24.00),
                        top: getVerticalSize(15.00),
                        right: getHorizontalSize(24.00)),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => AddRoom()));
                      },
                      child: Container(
                          height: getSize(50.00),
                          width: getSize(50.00),
                          child: SvgPicture.asset(ImageConstant.imgVector2,
                              fit: BoxFit.fill)),
                    ))),
          ),
          Positioned.fill(
            top: 700,
            child: Align(
                alignment: Alignment.center,
                child: Padding(
                    padding: EdgeInsets.only(
                        left: getHorizontalSize(24.00),
                        right: getHorizontalSize(24.00)),
                    child: Text("lbl_add_a_new_room".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: AppStyle.textstylepoppinssemibold15
                            .copyWith(fontSize: getFontSize(15.05))))),
          ),
        ]));
  }

  onTapBtnLh216() {
    Get.toNamed(AppRoutes.adminLh216Screen);
  }

  onTapBtnGoback() {
    Get.toNamed(AppRoutes.studentAdminChoiceScreen);
  }
}

class RoomBuild extends StatelessWidget {
  void _onFormSend(BuildContext context, String roomName) async {
    final url =
        "http://davidbrewu.atwebpages.com/swe_deleteroom.php?roomName=" +
            roomName;
    final response = await http.post(Uri.parse(url), body: {});
    if (response.body == "success") {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(roomName + " removed successfully")));
      //Navigator.of(context).pop();

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => AdminPageScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to remove " + roomName)));
    }
  }

  final MapData model;
  // Future<Widget> function;
  RoomBuild(this.model);
  @override
  Widget build(BuildContext context) {
    return model.roomName == "DEFAULT"
        ? SizedBox.shrink()
        : Align(
            alignment: Alignment.centerRight,
            child: Padding(
                padding: EdgeInsets.only(
                    left: getHorizontalSize(34.87),
                    top: getVerticalSize(30.00),
                    right: getHorizontalSize(34.87)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      GestureDetector(
                          onTap: () async {
                            Services.roomData(model.roomName!.tr).then((value) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DefaultLh216Screen(
                                      value, model.roomName)));
                            });
                            //  onTapBtnLh216();
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: getVerticalSize(49.91),
                              width: getHorizontalSize(231.80),
                              decoration:
                                  AppDecoration.textstylepoppinssemibold161,
                              child: Text(model.roomName!.tr,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.textstylepoppinssemibold161
                                      .copyWith(
                                          fontSize: getFontSize(16.69))))),
                      Padding(
                          padding: EdgeInsets.only(
                              left: getHorizontalSize(21.07),
                              top: getVerticalSize(9.98),
                              bottom: getVerticalSize(12.20)),
                          child: Container(
                              height: getVerticalSize(27.73),
                              width: getHorizontalSize(24.26),
                              child: InkWell(
                                onTap: () async {
                                  _onFormSend(context, model.roomName!);
                                },
                                child: SvgPicture.asset(ImageConstant.imgVector,
                                    fit: BoxFit.fill),
                              )))
                    ])));
  }
}
