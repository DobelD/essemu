import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../themes/colors/colors.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({
    Key? key,
    required this.child,
    this.isLoading = true,
  }) : super(key: key);

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Shimmer.fromColors(
            baseColor: kSofterGrey,
            highlightColor: kSofterGrey.withOpacity(0.2),
            child: child,
          )
        : child;
  }
}

class AppContentShimmer extends StatelessWidget {
  const AppContentShimmer(
      {super.key, required this.hight, required this.width});

  final double hight;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hight.h,
      width: width.w,
      decoration: BoxDecoration(
          color: kWhite, borderRadius: BorderRadius.circular(6.r)),
    );
  }
}
