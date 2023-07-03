import 'package:essemu/app/modules/add_menu/controllers/add_menu_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/decoration/app_padding.dart';
import '../../themes/decoration/app_radius.dart';
import '../../themes/typograpy/typo.dart';

class DropKategori extends StatelessWidget {
  const DropKategori(
      {super.key,
      this.trailling = false,
      this.textTrailling = 'Trailling',
      this.onTap});

  final bool trailling;
  final String? textTrailling;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddMenuController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'Kategori', style: AppTextTheme.current.bodyText),
                  TextSpan(text: '*', style: AppTextTheme.current.bodyTextRed),
                ],
              ),
            ),
            trailling
                ? GestureDetector(
                    onTap: onTap,
                    child: Text(
                      '${textTrailling}',
                      style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          color: kPrimary1,
                          fontWeight: FontWeight.w600),
                    ))
                : SizedBox()
          ],
        ),
        SizedBox(height: 8.h),
        Container(
            padding: DefaultPadding.all,
            height: 54.h,
            width: Get.width,
            decoration: BoxDecoration(
                borderRadius: AppRadius.icon,
                color: kSoftGrey.withOpacity(0.4)),
            child: GetBuilder<AddMenuController>(builder: (context) {
              return DropdownButton<String>(
                  value: controller.selectCtg,
                  hint: Text(
                    'Pilih Kategori',
                    style: AppTextTheme.current.bodyText,
                  ),
                  isExpanded: true,
                  underline: SizedBox(),
                  items: controller.listCategory
                      .map((ctg) => DropdownMenuItem<String>(
                          value: ctg.toString(),
                          child: Text(
                            ctg['name'].toString(),
                            style: AppTextTheme.current.bodyText,
                          )))
                      .toList(),
                  onChanged: (value) {
                    controller.changeCategory(value ?? '');
                  });
            })),
      ],
    );
  }
}
