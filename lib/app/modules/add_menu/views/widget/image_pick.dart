import 'package:essemu/app/modules/add_menu/controllers/add_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../themes/colors/colors.dart';
import '../../../../themes/decoration/app_padding.dart';
import '../../../../themes/decoration/app_radius.dart';
import '../../../../themes/typograpy/typo.dart';

class ImagePick extends StatelessWidget {
  const ImagePick({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddMenuController());
    return GetBuilder<AddMenuController>(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'Foto', style: AppTextTheme.current.bodyText),
                TextSpan(text: '*', style: AppTextTheme.current.bodyText),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          controller.menu == null
              ? GestureDetector(
                  onTap: () => Get.bottomSheet(
                      enterBottomSheetDuration: 520.milliseconds,
                      exitBottomSheetDuration: 520.milliseconds,
                      pickImages()),
                  child: Container(
                    height: 160.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: AppRadius.all,
                        color: kMain.withOpacity(0.08),
                        border: Border.all(
                            color: kMain.withOpacity(0.1), width: 1)),
                    child: Center(
                        child: Icon(
                      IconlyLight.camera,
                      size: 56,
                      color: kMain.withOpacity(0.16),
                    )),
                  ),
                )
              : GestureDetector(
                  onTap: () => Get.bottomSheet(
                      enterBottomSheetDuration: 520.milliseconds,
                      exitBottomSheetDuration: 520.milliseconds,
                      pickImages()),
                  child: Container(
                      height: 160.h,
                      width: Get.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: FileImage(controller.menu!),
                              fit: BoxFit.cover),
                          borderRadius: AppRadius.all,
                          color: kMain.withOpacity(0.08),
                          border: Border.all(
                              color: kMain.withOpacity(0.1), width: 1))),
                ),
        ],
      );
    });
  }
}

Widget pickImages() {
  final controller = Get.put(AddMenuController());
  return Container(
    padding: DefaultPadding.all,
    height: 120.h,
    width: Get.width,
    decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r))),
    child: Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              controller.getImageMenu();
              Get.back();
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: AppRadius.all,
                  color: kMain.withOpacity(0.08),
                  border: Border.all(color: kMain.withOpacity(0.1), width: 1)),
              child: Center(
                  child: Icon(
                IconlyLight.camera,
                size: 36,
                color: kMain.withOpacity(0.16),
              )),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: GestureDetector(
            onTap: () {
              controller.getImageGalery();
              Get.back();
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: AppRadius.all,
                  color: kMain.withOpacity(0.08),
                  border: Border.all(color: kMain.withOpacity(0.1), width: 1)),
              child: Center(
                  child: Icon(
                Icons.browse_gallery_outlined,
                size: 36,
                color: kMain.withOpacity(0.16),
              )),
            ),
          ),
        )
      ],
    ),
  );
}
