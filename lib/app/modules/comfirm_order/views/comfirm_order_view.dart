import 'package:essemu/app/components/loading_action/loading_fullbg.dart';
import 'package:essemu/app/components/spacer/sliver_spacer.dart';
import 'package:essemu/app/data/order_rest.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/comfirm_order_controller.dart';
import 'section/address_section.dart';
import 'section/appbar_section.dart';
import 'section/footer_section.dart';
import 'section/item_section.dart';

class ComfirmOrderView extends GetView<ComfirmOrderController> {
  const ComfirmOrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Users user = Get.arguments['user'];
    int fee = Get.arguments['fee'];
    String address = Get.arguments['address'];
    int id = Get.arguments['user_id'];
    int total = Get.arguments['total'];
    return GetBuilder<ComfirmOrderController>(builder: (c) {
      return AppLoadingFull(
        isLoading: c.isLoading,
        send: true,
        success: false,
        child: Scaffold(
          backgroundColor: kMainBackground,
          body: CustomScrollView(
            slivers: [
              AppBarSection(),
              SliverSpacerV(hight: 6),
              AddressSection(
                data: user,
                address: address,
              ),
              ItemSection(
                fee: fee,
              )
            ],
          ),
          bottomSheet: FooterSection(
              id: id, data: user, address: address, fee: fee, total: total),
        ),
      );
    });
  }
}
