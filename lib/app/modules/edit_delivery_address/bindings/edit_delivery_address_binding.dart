import 'package:get/get.dart';

import '../controllers/edit_delivery_address_controller.dart';

class EditDeliveryAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditDeliveryAddressController>(
      () => EditDeliveryAddressController(),
    );
  }
}
