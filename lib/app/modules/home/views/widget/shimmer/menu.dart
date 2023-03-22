import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../components/shimmer/shimmer.dart';

class MenuLoading extends StatelessWidget {
  const MenuLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Align(
                alignment: Alignment.centerLeft,
                child: AppShimmer(
                    child: AppContentShimmer(hight: 18, width: 80)))),
        SizedBox(height: 16.h),
        SizedBox(
          child: Wrap(
            direction: Axis.horizontal,
            children: List.generate(
                4,
                (index) => Padding(
                      padding: EdgeInsets.all(6.w),
                      child: AppShimmer(
                          child: AppContentShimmer(hight: 200, width: 158)),
                    )),
          ),
        )
      ],
    );
  }
}
