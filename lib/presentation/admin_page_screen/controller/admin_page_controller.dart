import '/core/app_export.dart';
import 'package:david_s_application/presentation/admin_page_screen/models/admin_page_model.dart';

class AdminPageController extends GetxController with StateMixin<dynamic> {
  Rx<AdminPageModel> adminPageModelObj = AdminPageModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
