import 'package:essemu/app/components/loading_action/loading_fullbg.dart';
import 'package:essemu/app/modules/detail_order/views/section/background_section.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_order_controller.dart';
import 'section/body_section.dart';

class DetailOrderView extends GetView<DetailOrderController> {
  const DetailOrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailOrderController>(builder: (c) {
      int id = Get.arguments['id_order'];
      int fee = Get.arguments['fee'];
      int rest = Get.arguments['rest'];

      return AppLoadingFull(
        isLoading: c.isLoading,
        success: true,
        child: Scaffold(
          backgroundColor: kBlack,
          body: CustomScrollView(
            slivers: [
              BackgroundSection()
              // AppBarSection(),
              // StatusSection(fee: fee),
              // ItemSection(id: id, fee: fee)
            ],
          ),
          bottomSheet: BodySection(
            id: id,
            fee: fee,
            idRest: rest,
          ),
        ),
      );
    });
  }
}
