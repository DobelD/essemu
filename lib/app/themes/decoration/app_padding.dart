import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultPadding {
  static EdgeInsets all = EdgeInsets.all(16.w);
  static EdgeInsets side = EdgeInsets.symmetric(horizontal: 16.w);
  static EdgeInsets updown = EdgeInsets.symmetric(vertical: 16.w);
  static EdgeInsets up = EdgeInsets.only(top: 16.w);
  static EdgeInsets down = EdgeInsets.only(bottom: 16.w);
  static EdgeInsets left = EdgeInsets.only(left: 16.w);
  static EdgeInsets right = EdgeInsets.only(right: 16.w);
}

class MiddlePadding {
  static EdgeInsets all = EdgeInsets.all(8.w);
  static EdgeInsets side = EdgeInsets.symmetric(horizontal: 8.w);
  static EdgeInsets updown = EdgeInsets.symmetric(vertical: 8.h);
  static EdgeInsets up = EdgeInsets.only(top: 8.h);
  static EdgeInsets down = EdgeInsets.only(bottom: 8.h);
  static EdgeInsets left = EdgeInsets.only(left: 8.w);
  static EdgeInsets right = EdgeInsets.only(right: 8.w);
}
