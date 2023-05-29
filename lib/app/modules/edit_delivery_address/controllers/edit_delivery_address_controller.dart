import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../carts/controllers/carts_controller.dart';
import '../services/user_service.dart';

class EditDeliveryAddressController extends GetxController {
  final ctrl = Get.put(CartsController());
  bool isLoading = false;
  late TextEditingController nameC;
  late TextEditingController phoneC;
  TextEditingController addressC = TextEditingController();

  updateUser() async {
    isLoading = true;
    update();
    final service = UpdateService();
    await service.update(
        Get.arguments['id'], nameC.text, phoneC.text, addressC.text);
    await ctrl.getUsers();
    Future.delayed(1.seconds, () {
      isLoading = false;
      update();
      Get.back();
    });
  }

  @override
  void onInit() {
    nameC = TextEditingController(text: Get.arguments['name']);
    phoneC = TextEditingController(text: Get.arguments['phone']);
    super.onInit();
  }

  @override
  void onClose() {
    nameC.clear();
    phoneC.clear();
    super.onClose();
  }
}
