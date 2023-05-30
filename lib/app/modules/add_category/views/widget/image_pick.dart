import 'package:dotted_border/dotted_border.dart';
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
    return GetBuilder<AddCategoryController>(builder: (context) {
      return DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(8),
          padding: EdgeInsets.all(1),
          color: kGrey3,
          strokeWidth: 1,
          dashPattern: [8, 4],
          child: Container(
              height: context.menu != null ? 389.h : 206.h,
              width: Get.width,
              padding: EdgeInsets.all(20.w),
              decoration:
                  BoxDecoration(color: kWhite, borderRadius: AppRadius.all),
              child: Column(
                children: [
                  context.menu != null
                      ? Container(
                          height: 240.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(
                                  image: FileImage(context.menu!),
                                  fit: BoxFit.cover)),
                        )
                      : SvgPicture.asset(
                          SgAssets.gallery,
                          width: 64.w,
                          height: 48.w,
                          colorFilter:
                              ColorFilter.mode(kGrey3, BlendMode.srcIn),
                        ),
                  SizedBox(height: 12.w),
                  Text(
                    'Upload Icon',
                    style: AppTextTheme.current.bodyText,
                  ),
                  SizedBox(height: 4.w),
                  Text(
                    'Pastikan format icon .svg',
                    style: AppTextTheme.current.hintText,
                  ),
                  SizedBox(height: 18.w),
                  SizedBox(
                      height: 30.w,
                      width: Get.width * 0.36,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: kPrimary1),
                                  borderRadius: AppRadius.icon)),
                          onPressed: () => context.getImageGalery(),
                          child: Center(
                              child: Text(
                            context.menu != null ? 'Upload ulang' : 'Upload',
                            style: AppTextTheme.current.bodyText,
                          ))))
                ],
              )));
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
