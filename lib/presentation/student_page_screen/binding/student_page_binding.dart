import '../controller/student_page_controller.dart';
import 'package:get/get.dart';

class StudentPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentPageController());
  }
}
