import 'package:essemu/app/utils/assets/json/json_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AppLoadingFull extends StatelessWidget {
  const AppLoadingFull({
    Key? key,
    required this.isLoading,
    this.child,
    this.success = false,
    this.send = false,
  }) : super(key: key);

  final bool isLoading;
  final Widget? child;
  final bool success;
  final bool send;

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
              color: Colors.white,
              child: Center(
                child: SizedBox(
                    height: success || send ? 130.w : 70.w,
                    width: success || send ? 130.w : 70.w,
                    child: Lottie.asset(success
                        ? LtAssets.success
                        : send
                            ? LtAssets.deliveryBike
                            : LtAssets.loading)),
              ),
            ),
          )
      ],
    );
  }
}
