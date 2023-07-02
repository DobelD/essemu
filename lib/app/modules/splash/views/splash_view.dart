import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:essemu/app/utils/assets/images/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../components/progress/animated_progressbar.dart';
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
              decoration: BoxDecoration(
                  color: kBlack,
                  image: DecorationImage(
                      image: AssetImage(ImgAssets.splash),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      colorFilter: ColorFilter.mode(kMain, BlendMode.color),
                      opacity: 0.2)),
              child: Stack(
                children: [
                  Positioned(
                      top: 300.w,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        ImgAssets.logo,
                        height: 100.w,
                        width: 200.w,
                      )),
                  Positioned(
                      bottom: 10,
                      right: 0,
                      left: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Essemu v.1.0',
                            textAlign: TextAlign.center,
                            style: AppTextTheme.current.bodyTextWhite,
                          ),
                          SizedBox(height: 8.w),
                          AnimatedProgressBar(
                              maxValue: 10,
                              value: 10,
                              duration: Duration(seconds: 3)),
                          SizedBox(height: 12.w),
                        ],
                      ))
                ],
              ),
            ),
          );
        });
  }
}
