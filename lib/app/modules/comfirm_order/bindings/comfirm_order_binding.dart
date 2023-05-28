import 'package:get/get.dart';

import '../controllers/comfirm_order_controller.dart';

class ComfirmOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComfirmOrderController>(
      () => ComfirmOrderController(),
    );
  }
}
