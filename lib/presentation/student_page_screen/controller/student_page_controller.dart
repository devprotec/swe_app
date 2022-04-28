import '/core/app_export.dart';
import 'package:david_s_application/presentation/student_page_screen/models/student_page_model.dart';

class StudentPageController extends GetxController with StateMixin<dynamic> {
  Rx<StudentPageModel> studentPageModelObj = StudentPageModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
