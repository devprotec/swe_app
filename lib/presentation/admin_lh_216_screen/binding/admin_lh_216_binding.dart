import '../controller/admin_lh_216_controller.dart';
import 'package:get/get.dart';

class AdminLh216Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminLh216Controller());
  }
}
