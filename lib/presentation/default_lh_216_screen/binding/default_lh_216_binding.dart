import '../controller/default_lh_216_controller.dart';
import 'package:get/get.dart';

class DefaultLh216Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DefaultLh216Controller());
  }
}
