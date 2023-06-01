import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../themes/colors/colors.dart';
import '../../../themes/decoration/app_padding.dart';
import '../../../themes/decoration/app_radius.dart';
import '../../../themes/typograpy/typo.dart';
import '../../../utils/assets/svg/svg_assets.dart';
import '../controllers/edit_profile_controller.dart';

class PickerImages extends StatelessWidget {
  const PickerImages({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfileController());
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
                    border:
                        Border.all(color: kMain.withOpacity(0.1), width: 1)),
                child: Center(
                    child: SvgPicture.asset(SgAssets.photoCamera,
                        colorFilter: ColorFilter.mode(kGrey3, BlendMode.srcIn),
                        height: 48,
                        width: 58)),
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
                    border:
                        Border.all(color: kMain.withOpacity(0.1), width: 1)),
                child: Center(
                    child: Column(
                  children: [
                    SvgPicture.asset(SgAssets.gallery,
                        colorFilter: ColorFilter.mode(kGrey3, BlendMode.srcIn),
                        height: 28,
                        width: 28),
                    SizedBox(height: 8.w),
                    Text(
                      'Ambil dari galery',
                      style: AppTextTheme.current.filter,
                    )
                  ],
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
