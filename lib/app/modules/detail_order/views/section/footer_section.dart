import 'package:essemu/app/components/button/app_button_primary.dart';
import 'package:essemu/app/modules/detail_order/controllers/detail_order_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailOrderController());
    return Container(
        width: Get.width,
        color: kWhite,
        padding: DefaultPadding.all,
        child: AppButtonPrimary(
          label: 'Terima Pesanan',
          onPressed: () => controller.onOrderSuccess(),
        ));
  }
}
