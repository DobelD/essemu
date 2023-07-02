import 'package:get/get.dart';

import '../controllers/edit_menu_controller.dart';

class EditMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditMenuController>(
      () => EditMenuController(),
    );
  }
}
