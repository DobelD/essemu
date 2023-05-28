import 'package:essemu/app/components/button/app_button_primary.dart';
import 'package:essemu/app/modules/comfirm_order/controllers/comfirm_order_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ComfirmOrderController());
    return Container(
        height: 72.w,
        width: Get.height,
        color: kWhite,
        padding: DefaultPadding.all,
        child: Row(
          children: [
            Expanded(
              child: AppButtonPrimary(
                  label: 'Send Order', onPressed: () => controller.toSend(id)),
            ),
            SizedBox(width: 10.w),
            SizedBox(
                width: 38.w,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kAlert1,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r))),
                    onPressed: () {},
                    child: Center(
                        child: Icon(IconlyLight.document, color: kWhite))))
          ],
        ));
  }
}
