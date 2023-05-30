import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../themes/colors/colors.dart';
import '../../themes/decoration/app_radius.dart';
import '../../themes/typograpy/typo.dart';

class AppButton extends StatelessWidget {
  const AppButton.primary(
      {super.key,
      this.bgColor = kSecondary1,
      this.border = Colors.transparent,
      this.onPressed,
      this.text,
      this.icon,
      this.height = 38,
      this.iconText = false,
      this.isLoading = false,
      this.isSecond = false});
  const AppButton.secondary(
      {super.key,
      this.bgColor = kWhite,
      this.border = kSecondary1,
      this.onPressed,
      this.text,
      this.icon,
      this.height = 38,
      this.iconText = false,
      this.isLoading = false,
      this.isSecond = true});
  const AppButton.secondarySmall(
      {super.key,
      this.bgColor = kWhite,
      this.border = kSecondary1,
      this.onPressed,
      this.text,
      this.icon,
      this.height = 28,
      this.iconText = false,
      this.isLoading = false,
      this.isSecond = true});
  const AppButton.primarySmall(
      {super.key,
      this.bgColor = kSecondary1,
      this.border = Colors.transparent,
      this.onPressed,
      this.text,
      this.icon,
      this.height = 28,
      this.iconText = false,
      this.isLoading = false,
      this.isSecond = false});
  const AppButton.iconText(
      {super.key,
      this.bgColor = kSecondary1,
      this.border = Colors.transparent,
      this.onPressed,
      this.text,
      this.icon,
      this.height = 28,
      this.iconText = true,
      this.isLoading = false,
      this.isSecond = false});

  final Color? bgColor;
  final VoidCallback? onPressed;
  final String? text;
  final bool iconText;
  final bool isSecond;
  final double? height;
  final String? icon;
  final Color border;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height?.w,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                disabledBackgroundColor: kGrey3,
                backgroundColor: bgColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: AppRadius.icon,
                    side: BorderSide(color: border))),
            onPressed: onPressed,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconText == true
                      ? SizedBox(
                          height: 10.w,
                          width: 10.w,
                          child: SvgPicture.asset(icon ?? ''))
                      : SizedBox(),
                  SizedBox(width: iconText == true ? 8.w : 0),
                  Text(
                    '$text',
                    style: isSecond == false
                        ? AppTextTheme.current.bodyText
                        : onPressed != null
                            ? AppTextTheme.current.bodyTextWhite
                            : AppTextTheme.current.bodyText,
                  ),
                ],
              ),
            )));
  }
}
