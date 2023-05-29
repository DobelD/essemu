import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/utils/assets/svg/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../themes/colors/colors.dart';
import '../../../../themes/decoration/app_radius.dart';
import '../../../../themes/typograpy/typo.dart';
import '../../controllers/add_category_controller.dart';

class ImagePick extends StatelessWidget {
  const ImagePick({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddCategoryController());
    return GetBuilder<AddCategoryController>(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'Icons', style: AppTextTheme.current.bodyText),
                TextSpan(text: '*', style: AppTextTheme.current.bodyTextRed),
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
                        color: kGrey4,
                        border: Border.all(
                            color: kMain.withOpacity(0.1), width: 1)),
                    child: Center(
                        child: SvgPicture.asset(SgAssets.gallery,
                            colorFilter:
                                ColorFilter.mode(kGrey2, BlendMode.srcIn),
                            height: 48,
                            width: 58)),
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
                          color: kGrey4,
                          border: Border.all(
                              color: kMain.withOpacity(0.1), width: 1))),
                ),
        ],
      );
    });
  }
}

Widget pickImages() {
  final controller = Get.put(AddCategoryController());
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
                  color: kGrey4,
                  border: Border.all(color: kMain.withOpacity(0.1), width: 1)),
              child: Center(
                  child: SvgPicture.asset(SgAssets.photoCamera,
                      height: 48, width: 58)),
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
                  color: kGrey4,
                  border: Border.all(color: kMain.withOpacity(0.1), width: 1)),
              child: Center(
                  child: SvgPicture.asset(SgAssets.gallery,
                      height: 48, width: 58)),
            ),
          ),
        )
      ],
    ),
  );
}
