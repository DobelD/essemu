import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/colors/colors.dart';
import '../../themes/decoration/app_padding.dart';
import '../../utils/assets/svg/svg_assets.dart';

class PickerImages extends StatelessWidget {
  const PickerImages.single(
      {super.key, this.isDouble = false, this.onTapCamera, this.onTapGallery});
  const PickerImages.double(
      {super.key, this.isDouble = true, this.onTapCamera, this.onTapGallery});

  final bool isDouble;
  final GestureTapCallback? onTapCamera;
  final GestureTapCallback? onTapGallery;

  @override
  Widget build(BuildContext context) {
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
          isDouble != false
              ? GestureDetector(
                  onTap: onTapCamera,
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
                          style: GoogleFonts.inter(
                              fontSize: 12, color: kSofterBlack))
                    ],
                  ),
                )
              : SizedBox(),
          isDouble != false ? SizedBox(width: 26.w) : SizedBox(),
          GestureDetector(
            onTap: onTapGallery,
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
