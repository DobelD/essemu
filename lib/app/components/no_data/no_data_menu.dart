import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class NoMenu extends StatelessWidget {
  const NoMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: 320.h,
      width: Get.width * 0.8,
      child: Lottie.network(
          'https://assets1.lottiefiles.com/packages/lf20_ksvhhsdk.json'),
    ));
  }
}
