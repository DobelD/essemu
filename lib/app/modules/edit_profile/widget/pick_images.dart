import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../themes/colors/colors.dart';
import '../../../themes/decoration/app_padding.dart';
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
        color: kMain,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: () => controller.getImageMenu(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 32.w,
                  width: 32.w,
                  child: SvgPicture.asset(SgAssets.camera),
                ),
                SizedBox(height: 6.w),
                Text('Camera',
                    style: GoogleFonts.inter(fontSize: 12, color: kSofterBlack))
              ],
            ),
          ),
          SizedBox(width: 26.w),
          GestureDetector(
            onTap: () => controller.getImageGalery(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 32.w,
                  width: 32.w,
                  child: SvgPicture.asset(SgAssets.photoGallery),
                ),
                SizedBox(height: 6.w),
                Text('Gallery',
                    style: GoogleFonts.inter(fontSize: 12, color: kSofterBlack))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
