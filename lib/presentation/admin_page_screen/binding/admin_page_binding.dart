import '../controller/admin_page_controller.dart';
import 'package:get/get.dart';

class AdminPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminPageController());
  }
}
