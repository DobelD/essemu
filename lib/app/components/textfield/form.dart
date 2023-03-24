import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/decoration/app_radius.dart';

class FormTxt extends StatelessWidget {
  const FormTxt({super.key, this.title, this.hint, this.controller});

  final String? title;
  final String? hint;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: title, style: AppTextTheme.current.bodyText),
              TextSpan(text: '*', style: AppTextTheme.current.bodyTextRed),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 54.h,
          child: TextFormField(
            controller: controller,
            style: AppTextTheme.current.bodyText,
            cursorColor: kMain,
            decoration: InputDecoration(
                filled: true,
                hintText: 'Isi ${hint} menu',
                hintStyle: AppTextTheme.current.hintText,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
                border: OutlineInputBorder(
                    borderRadius: AppRadius.icon,
                    borderSide: BorderSide(color: kSofterGrey)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: AppRadius.icon,
                    borderSide: BorderSide(
                      color: kSofterGrey,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: AppRadius.icon,
                    borderSide: BorderSide(
                      color: kSofterGrey,
                    ))),
          ),
        ),
      ],
    );
  }
}
