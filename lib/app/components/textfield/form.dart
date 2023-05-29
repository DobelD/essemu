import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/decoration/app_radius.dart';

class FormTxt extends StatefulWidget {
  const FormTxt(
      {super.key,
      this.title,
      this.hint,
      this.controller,
      this.isPassword = false});
  const FormTxt.password(
      {super.key,
      this.title,
      this.hint,
      this.controller,
      this.isPassword = true});

  final String? title;
  final String? hint;
  final TextEditingController? controller;
  final bool isPassword;

  @override
  State<FormTxt> createState() => _FormTxtState();
}

class _FormTxtState extends State<FormTxt> {
  bool isObscureText = false;

  @override
  void initState() {
    super.initState();

    isObscureText = widget.isPassword;
  }

  void suffixPasswordOnTap() {
    setState(() {
      isObscureText = !isObscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: widget.title, style: AppTextTheme.current.bodyText),
              TextSpan(text: '*', style: AppTextTheme.current.bodyTextRed),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 48.h,
          child: TextFormField(
            controller: widget.controller,
            style: AppTextTheme.current.bodyText,
            cursorColor: kMain,
            obscureText: isObscureText,
            decoration: InputDecoration(
                filled: true,
                hintText: 'Isi ${widget.hint} disini',
                hintStyle: AppTextTheme.current.hintText,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                suffixIcon: widget.isPassword
                    ? IconButton(
                        onPressed: suffixPasswordOnTap,
                        icon: Icon(
                          isObscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 20.w,
                          color: kSoftGrey,
                        ),
                      )
                    : null,
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
