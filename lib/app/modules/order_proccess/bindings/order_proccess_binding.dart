import 'package:get/get.dart';

import '../controllers/order_proccess_controller.dart';

class OrderProccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderProccessController>(
      () => OrderProccessController(),
    );
  }
}
