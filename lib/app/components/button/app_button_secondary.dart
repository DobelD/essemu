import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/colors/colors.dart';
import 'app_button_style.dart';

class AppButtonSecondary extends StatelessWidget with AppButtonStyleMixin {
  const AppButtonSecondary({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isEnabled = true,
    this.iconData,
    this.isLoading,
    this.isSuccess,
    this.sizeType = AppButtonSize.normal,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;
  final bool isEnabled;
  final IconData? iconData;
  final bool? isLoading;
  final bool? isSuccess;
  final AppButtonSize sizeType;

  ButtonStyle get buttonStyle => ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) => Colors.transparent,
        ),
        side: MaterialStateProperty.resolveWith<BorderSide>((states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(color: kSoftGrey, width: 1.w);
          }
          return BorderSide(color: kMain, width: 1.w);
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
          if (states.contains(MaterialState.disabled)) {
            return kSoftGrey;
          }
          return kMain;
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
            child: Text(label),
          )
        : ElevatedButton.icon(
            style: buttonStyle,
            onPressed: isEnabled ? onPressed : null,
            icon: Icon(iconData, size: 24.w, color: kMain),
            label: Text(label),
          );
  }
}
