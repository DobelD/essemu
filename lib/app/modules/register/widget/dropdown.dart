import 'package:essemu/app/modules/register/controllers/register_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../themes/decoration/app_padding.dart';
import '../../../themes/decoration/app_radius.dart';
import '../../../themes/typograpy/typo.dart';

class DropGender extends StatelessWidget {
  const DropGender(
      {super.key,
      this.trailling = false,
      this.textTrailling = 'Trailling',
      this.onTap});

  final bool trailling;
  final String? textTrailling;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
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
                      text: 'Select Gender',
                      style: AppTextTheme.current.bodyText),
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
            child: GetBuilder<RegisterController>(builder: (context) {
              return DropdownButton<String>(
                  value: controller.selectedGender,
                  hint: Text(
                    'Gender',
                    style: AppTextTheme.current.bodyText,
                  ),
                  isExpanded: true,
                  underline: SizedBox(),
                  items: controller.listGender
                      .map((gedr) => DropdownMenuItem<String>(
                          value: gedr['name'].toString(),
                          child: Text(
                            gedr['name'].toString(),
                            style: AppTextTheme.current.bodyText,
                          )))
                      .toList(),
                  onChanged: (value) {
                    controller.updateGender(value!);
                  });
            })),
      ],
    );
  }
}
