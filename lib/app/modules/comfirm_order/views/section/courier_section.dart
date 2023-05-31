import 'package:essemu/app/modules/comfirm_order/controllers/comfirm_order_controller.dart';
import 'package:essemu/app/modules/comfirm_order/views/widget/dropdown.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourierSection extends StatelessWidget {
  const CourierSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComfirmOrderController>(builder: (c) {
      return SliverPadding(
        padding: DefaultPadding.all,
        sliver: SliverToBoxAdapter(
          child: DropCourier(
            trailling: false,
          ),
        ),
      );
    });
  }
}
