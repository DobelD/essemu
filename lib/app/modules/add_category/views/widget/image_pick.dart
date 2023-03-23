import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

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
                TextSpan(text: 'Foto', style: AppTextTheme.current.bodyText),
                TextSpan(text: '*', style: AppTextTheme.current.bodyText),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          controller.menu == null
              ? GestureDetector(
                  onTap: () => controller.getImageMenu(),
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
              : Container(
                  height: 160.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(controller.menu!),
                          fit: BoxFit.cover),
                      borderRadius: AppRadius.all,
                      color: kMain.withOpacity(0.08),
                      border:
                          Border.all(color: kMain.withOpacity(0.1), width: 1))),
        ],
      );
    });
  }
}
