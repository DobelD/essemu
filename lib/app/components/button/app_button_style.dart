import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/typograpy/typo.dart';

enum AppButtonSize { normal, small }

mixin AppButtonStyleMixin {
  double getRadius(AppButtonSize sizeType) {
    return sizeType == AppButtonSize.normal ? 8.w : 6.w;
  }

  EdgeInsets getPadding(AppButtonSize sizeType) {
    return sizeType == AppButtonSize.normal
        ? EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w)
        : EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.w);
  }

  TextStyle getTextStyle(AppButtonSize sizeType) {
    return sizeType == AppButtonSize.normal
        ? AppTextTheme.current.buttonTextNormal
        : AppTextTheme.current.buttonTextSmall;
  }
}
