import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRadius {
  static BorderRadius all = BorderRadius.circular(8.r);
  static BorderRadius allRounded = BorderRadius.circular(45.r);
  static BorderRadius icon = BorderRadius.circular(10.r);
  static BorderRadius top = BorderRadius.only(
      topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r));
}
