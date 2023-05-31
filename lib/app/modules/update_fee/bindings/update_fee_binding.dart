import 'package:get/get.dart';

import '../controllers/update_fee_controller.dart';

class UpdateFeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateFeeController>(
      () => UpdateFeeController(),
    );
  }
}
