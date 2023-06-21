import 'package:dotted_border/dotted_border.dart';
import 'package:essemu/app/modules/campaign/controllers/campaign_controller.dart';
import 'package:essemu/app/utils/assets/svg/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../components/picker/picker_images.dart';
import '../../../../themes/colors/colors.dart';
import '../../../../themes/decoration/app_radius.dart';
import '../../../../themes/typograpy/typo.dart';

class ImagePick extends StatelessWidget {
  const ImagePick({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CampaignController>(builder: (context) {
      return DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(8),
          padding: EdgeInsets.all(1),
          color: kGrey3,
          strokeWidth: 1,
          dashPattern: [8, 4],
          child: Container(
              height: context.campaign != null ? 389.h : 206.h,
              width: Get.width,
              padding: EdgeInsets.all(20.w),
              decoration:
                  BoxDecoration(color: kWhite, borderRadius: AppRadius.all),
              child: Column(
                children: [
                  context.campaign != null
                      ? Container(
                          height: 240.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(
                                  image: FileImage(context.campaign!),
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
                    'Upload images',
                    style: AppTextTheme.current.bodyText,
                  ),
                  SizedBox(height: 4.w),
                  Text(
                    'Pastikan format images .svg',
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
                          onPressed: () => Get.bottomSheet(PickerImages.single(
                                onTapGallery: () => context.getImageGalery(),
                              )),
                          child: Center(
                              child: Text(
                            context.campaign != null
                                ? 'Upload ulang'
                                : 'Upload',
                            style: AppTextTheme.current.bodyText,
                          ))))
                ],
              )));
    });
  }
}
