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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppShimmer(child: AppContentShimmer(hight: 18, width: 80)),
                AppShimmer(child: AppContentShimmer(hight: 18, width: 46)),
              ],
            )),
        SizedBox(height: 16.h),
        SizedBox(
          height: 260.h,
          child: ListView.separated(
              padding: EdgeInsets.only(left: 16.w),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (_, index) {
                return AppShimmer(
                    child: AppContentShimmer(hight: 260, width: 170));
              },
              separatorBuilder: (__, i) => SizedBox(width: 12.w),
              itemCount: 3),
        )
      ],
    );
  }
}
