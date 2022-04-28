import '/core/app_export.dart';
import 'package:david_s_application/presentation/student_admin_choice_screen/models/student_admin_choice_model.dart';

class StudentAdminChoiceController extends GetxController
    with StateMixin<dynamic> {
  Rx<StudentAdminChoiceModel> studentAdminChoiceModelObj =
      StudentAdminChoiceModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
