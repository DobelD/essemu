import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../themes/colors/colors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.login(),
        builder: (context, snap) {
          return Material(
            child: Container(
              height: ScreenUtil().screenHeight,
              width: ScreenUtil().screenWidth,
              color: kMainDark,
              child: Center(
                  child: Container(
                height: 120.h,
                width: 220.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'))),
              )),
            ),
          );
        });
  }
}
