import 'package:essemu/app/components/loading_action/loading_fullbg.dart';
import 'package:essemu/app/components/spacer/sliver_spacer.dart';
import 'package:essemu/app/data/user.dart';
import 'package:essemu/app/modules/carts/views/section/address_section.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/carts_controller.dart';
import 'section/add_new_item.dart';
import 'section/app_bar.dart';
import 'section/footer_section.dart';
import 'section/list_menu_section.dart';

class CartsView extends GetView<CartsController> {
  const CartsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartsController());
    User user = Get.arguments;
    return GetBuilder<CartsController>(builder: (context) {
      // print(mappedList);
      // print(totalFee);
      // print(total);
      return AppLoadingFull(
        isLoading: controller.isLoading,
        child: Scaffold(
          backgroundColor: kMainBackground,
          body: CustomScrollView(
            slivers: [
              AppBarSection(),
              SliverSpacerV(hight: 6),
              AddressSection(data: user),
              ListMenuSection(),
              controller.isCartEmpty ? SliverToBoxAdapter() : AddNewMenu(),
              SliverSpacerV(hight: 212)
            ],
          ),
          bottomSheet: controller.isCartEmpty ? null : FooterSection(),
        ),
      );
    });
  }
}
