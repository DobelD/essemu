import 'package:essemu/app/utils/assets/json/json_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({
    Key? key,
    required this.isLoading,
    this.child,
  }) : super(key: key);

  final bool isLoading;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: child ?? const SizedBox.shrink(),
        ),
        if (isLoading)
          Positioned.fill(
            child: Container(
              color: Colors.white.withOpacity(0.5),
              child: Center(
                child: SizedBox(
                    height: 70.w,
                    width: 70.w,
                    child: Lottie.asset(LtAssets.loading)),
              ),
            ),
          )
      ],
    );
  }
}
