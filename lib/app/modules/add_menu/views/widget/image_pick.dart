import 'package:dotted_border/dotted_border.dart';
import 'package:essemu/app/components/picker/picker_images.dart';
import 'package:essemu/app/modules/add_menu/controllers/add_menu_controller.dart';
import 'package:essemu/app/utils/assets/svg/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../themes/colors/colors.dart';
import '../../../../themes/decoration/app_radius.dart';
import '../../../../themes/typograpy/typo.dart';

class ImagePick extends StatelessWidget {
  const ImagePick({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddMenuController>(builder: (c) {
      return DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(8),
          padding: EdgeInsets.all(1),
          color: kGrey3,
          strokeWidth: 1,
          dashPattern: [8, 4],
          child: Container(
              height: c.menu != null
                  ? 389.h
                  : Get.arguments['action'] == 'edit'
                      ? 389.h
                      : 206.h,
              width: Get.width,
              padding: EdgeInsets.all(20.w),
              decoration:
                  BoxDecoration(color: kWhite, borderRadius: AppRadius.all),
              child: Column(
                children: [
                  c.menu != null
                      ? SizedBox(
                          child: Container(
                            height: 240.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                image: DecorationImage(
                                    image: FileImage(c.menu!),
                                    fit: BoxFit.cover)),
                          ),
                        )
                      : SizedBox(
                          child: Get.arguments['action'] == 'edit'
                              ? Container(
                                  height: 240.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              '${c.publicUrlImages}/${c.dataMenu.name}'),
                                          fit: BoxFit.cover)),
                                )
                              : SvgPicture.asset(
                                  SgAssets.gallery,
                                  width: 64.w,
                                  height: 48.w,
                                  colorFilter:
                                      ColorFilter.mode(kGrey3, BlendMode.srcIn),
                                ),
                        ),
                  SizedBox(height: 12.w),
                  Text(
                    'Ambil gambar',
                    style: AppTextTheme.current.bodyText,
                  ),
                  SizedBox(height: 4.w),
                  Text(
                    'Pastikan format icon .jpg',
                    style: AppTextTheme.current.hintText,
                  ),
                  SizedBox(height: 18.w),
                  SizedBox(
                      height: 30.w,
                      width: Get.width * 0.4,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: kPrimary1),
                                  borderRadius: AppRadius.icon)),
                          onPressed: () => Get.bottomSheet(PickerImages.double(
                                onTapCamera: () => c.getImageMenu(),
                                onTapGallery: () => c.getImageGalery(),
                              )),
                          child: Center(
                              child: Text(
                            c.menu != null
                                ? 'Upload ulang'
                                : Get.arguments['action'] == 'edit'
                                    ? 'Ganti Gambar'
                                    : 'Upload',
                            style: AppTextTheme.current.bodyText,
                          ))))
                ],
              )));
    });
  }
}
