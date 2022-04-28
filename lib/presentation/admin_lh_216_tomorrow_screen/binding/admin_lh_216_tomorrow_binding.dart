import '../controller/admin_lh_216_tomorrow_controller.dart';
import 'package:get/get.dart';

class AdminLh216TomorrowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminLh216TomorrowController());
  }
}
