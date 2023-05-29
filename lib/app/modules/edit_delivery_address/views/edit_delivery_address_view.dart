import 'package:essemu/app/components/loading_action/loading_fullbg.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_delivery_address_controller.dart';
import 'section/appbar_section.dart';
import 'section/footer_section.dart';
import 'section/form_section.dart';

class EditDeliveryAddressView extends GetView<EditDeliveryAddressController> {
  const EditDeliveryAddressView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditDeliveryAddressController());
    return GetBuilder<EditDeliveryAddressController>(builder: (c) {
      return AppLoadingFull(
        isLoading: controller.isLoading,
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              AppBarSection(),
              FormSection(),
            ],
          ),
          bottomSheet: FooterSection(),
        ),
      );
    });
  }
}
