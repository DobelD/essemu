import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../themes/colors/colors.dart';

class SafeAreaSection extends StatelessWidget {
  const SafeAreaSection({super.key});

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
          height: 34.h,
          color: kMain,
        ),
      ],
    );
  }

  @override
  double get maxExtent => 34.h;

  @override
  double get minExtent => 34.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
