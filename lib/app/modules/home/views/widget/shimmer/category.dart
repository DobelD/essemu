import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../components/shimmer/shimmer.dart';

class CategoryLoading extends StatelessWidget {
  const CategoryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
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
          height: 36.h,
          child: ListView.separated(
              padding: EdgeInsets.only(left: 16.w),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (_, index) {
                return AppShimmer(
                    child: AppContentShimmer(hight: 36, width: 80));
              },
              separatorBuilder: (__, i) => SizedBox(width: 12.w),
              itemCount: 4),
        )
      ],
    );
  }
}
