import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Offline extends StatelessWidget {
  const Offline({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            height: 500.h,
            width: Get.width * 0.9,
            child: Lottie.asset('assets/lottie/offline.json')));
  }
}
