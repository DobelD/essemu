import 'package:essemu/app/modules/main_admin/controllers/main_admin_controller.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../themes/colors/colors.dart';
import '../../../../themes/decoration/app_radius.dart';
import '../../../../themes/typograpy/typo.dart';

class ItemMainMenu extends StatelessWidget {
  const ItemMainMenu(
      {super.key,
      this.icon,
      this.label,
      this.onPressed,
      this.id,
      this.selected});
  final IconData? icon;
  final String? label;
  final VoidCallback? onPressed;
  final int? id;
  final bool? selected;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainAdminController());
    return Padding(
      padding: MiddlePadding.down,
      child: SizedBox(
          height: 48.h,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: selected! ? kSoftRed : Colors.transparent,
                  foregroundColor: kSoftRed,
                  shape: RoundedRectangleBorder(borderRadius: AppRadius.all)),
              onPressed: () => controller.changePages(id!),
              child: Row(
                children: [
                  Icon(icon, color: kWhite),
                  SizedBox(width: 16.w),
                  Text(
                    '$label',
                    style: AppTextTheme.current.bodyTextWhite,
                  )
                ],
              ))),
    );
  }
}
