import 'package:essemu/app/themes/decoration/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../themes/colors/colors.dart';
import '../../../../themes/typograpy/typo.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(pinned: true, delegate: MyHeaderDelegate());
  }
}

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(
      children: [
        Container(
          height: 64.h,
          color: kWhite,
          child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (_, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  height: 32.h,
                  decoration: BoxDecoration(
                      color: kSoftGrey, borderRadius: AppRadius.all),
                  child: Center(
                      child: Text('Bakso Bakar',
                          style: AppTextTheme.current.bodyText)),
                );
              },
              separatorBuilder: (_, i) => SizedBox(width: 12.w),
              itemCount: 10),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 64.h;

  @override
  double get minExtent => 64.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
