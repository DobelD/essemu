import 'package:essemu/app/modules/update_fee/controllers/update_fee_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/button/app_button_primary.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateFeeController());
    return Container(
        height: 72.w,
        width: Get.width,
        color: kWhite,
        padding: DefaultPadding.all,
        child: AppButtonPrimary(
          label: 'Update',
          onPressed: () => controller.updates(),
        ));
  }
}
