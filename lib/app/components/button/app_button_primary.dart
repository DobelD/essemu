import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../button/app_button_style.dart';
import '../../themes/colors/colors.dart';

class AppButtonPrimary extends StatelessWidget with AppButtonStyleMixin {
  const AppButtonPrimary({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isEnabled = true,
    this.iconData,
    this.isLoading,
    this.isSuccess,
    this.invert = false,
    this.sizeType = AppButtonSize.normal,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;
  final bool isEnabled;
  final IconData? iconData;
  final bool? isLoading;
  final bool? isSuccess;
  final bool invert;
  final AppButtonSize sizeType;

  ButtonStyle get buttonStyle => ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return kSoftGrey;
          } else if (invert == true) {
            return kWhite;
          } else {
            return kMain;
          }
        }),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(getRadius(sizeType)),
            ),
          ),
        ),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (states) => getTextStyle(sizeType),
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          return kWhite;
        }),
        elevation: MaterialStateProperty.resolveWith<double>((states) => 0.0),
        overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.pressed)) {
            return kMainDark;
          }
          return kMain;
        }),
        padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
          (states) => getPadding(sizeType),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return iconData == null
        ? ElevatedButton(
            style: buttonStyle,
            onPressed: isEnabled ? onPressed : null,
            child: Text(label,
                style: invert == true
                    ? AppTextTheme.current.buttonText
                    : AppTextTheme.current.buttonTextDark),
          )
        : ElevatedButton.icon(
            style: buttonStyle,
            onPressed: isEnabled ? onPressed : null,
            icon: Icon(iconData, size: 24.w, color: kWhite),
            label: Text(label),
          );
  }
}
