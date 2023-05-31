import 'package:essemu/app/modules/update_fee/controllers/update_fee_controller.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/textfield/form.dart';

class FeeSection extends StatelessWidget {
  const FeeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateFeeController());
    return SliverPadding(
      padding: DefaultPadding.all,
      sliver: SliverToBoxAdapter(
        child: FormTxt(
          controller: controller.fee,
          title: 'Delivery Fee',
          hint: 'email',
        ),
      ),
    );
  }
}
