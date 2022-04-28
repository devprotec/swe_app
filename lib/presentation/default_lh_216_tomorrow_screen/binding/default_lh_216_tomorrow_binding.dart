import '../controller/default_lh_216_tomorrow_controller.dart';
import 'package:get/get.dart';

class DefaultLh216TomorrowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DefaultLh216TomorrowController());
  }
}
