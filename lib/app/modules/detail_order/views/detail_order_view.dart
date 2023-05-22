import 'package:essemu/app/components/loading_action/loading_fullbg.dart';
import 'package:essemu/app/modules/detail_order/views/section/status_seection.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_order_controller.dart';
import 'section/appbar_section.dart';
import 'section/footer_section.dart';
import 'section/item_section.dart';

class DetailOrderView extends GetView<DetailOrderController> {
  const DetailOrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailOrderController>(builder: (c) {
      int id = Get.arguments['id_order'];
      // String status = Get.arguments['status'];
      int fee = Get.arguments['fee'];
      return AppLoadingFull(
        isLoading: c.isLoading,
        success: true,
        child: Scaffold(
          backgroundColor: kMainBackground,
          body: CustomScrollView(
            slivers: [
              AppBarSection(),
              StatusSection(),
              ItemSection(id: id, fee: fee)
            ],
          ),
          bottomSheet: FooterSection(),
        ),
      );
    });
  }
}
