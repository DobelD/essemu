import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../components/shimmer/shimmer.dart';

class HeadingLoading extends StatelessWidget {
  const HeadingLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    AppShimmer(child: AppContentShimmer(hight: 20, width: 80)),
                    SizedBox(width: 6.w),
                    AppShimmer(child: AppContentShimmer(hight: 20, width: 20)),
                  ],
                ),
              ),
              SizedBox(height: 6.w),
              AppShimmer(child: AppContentShimmer(hight: 14, width: 50)),
            ],
          ),
        ),
        AppShimmer(child: AppContentShimmer(hight: 20, width: 20)),
      ],
    );
  }
}
