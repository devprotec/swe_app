import '../controller/student_admin_choice_controller.dart';
import 'package:get/get.dart';

class StudentAdminChoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentAdminChoiceController());
  }
}
