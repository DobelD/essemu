import 'package:get/get.dart';

import '../controllers/homes_controller.dart';

class HomesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomesController>(
      () => HomesController(),
    );
  }
}
