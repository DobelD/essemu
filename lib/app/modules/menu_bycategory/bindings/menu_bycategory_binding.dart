import 'package:get/get.dart';

import '../controllers/menu_bycategory_controller.dart';

class MenuBycategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuBycategoryController>(
      () => MenuBycategoryController(),
    );
  }
}
