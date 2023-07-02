import 'package:get/get.dart';

import '../controllers/chenge_password_controller.dart';

class ChengePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChengePasswordController>(
      () => ChengePasswordController(),
    );
  }
}
