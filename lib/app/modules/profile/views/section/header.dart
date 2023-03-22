import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../themes/decoration/app_radius.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(pinned: true, delegate: MyHeaderDelegate());
  }
}

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: DefaultPadding.all,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 90.w,
              width: 90.w,
              decoration:
                  BoxDecoration(color: kSoftMain, shape: BoxShape.circle),
            ),
            SizedBox(width: 8.w),
            SizedBox(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Moch Ali Imron',
                  style: AppTextTheme.current.title3,
                ),
                SizedBox(height: 4.h),
                Text(
                  'ali.imronashter@gmail.com',
                  style: AppTextTheme.current.title6,
                ),
                SizedBox(height: 12.h),
                InkWell(
                    onTap: () {},
                    borderRadius: AppRadius.all,
                    child: Container(
                      height: 30.w,
                      width: 90.w,
                      padding: MiddlePadding.all,
                      decoration: BoxDecoration(
                          borderRadius: AppRadius.all, color: kSoftRed),
                      child: Center(
                          child: Text('Edit',
                              style: AppTextTheme.current.bodyText)),
                    ))
              ],
            ))
          ]),
    );
  }

  @override
  double get maxExtent => 120.h;

  @override
  double get minExtent => 40.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
