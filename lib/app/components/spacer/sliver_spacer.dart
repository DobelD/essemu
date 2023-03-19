import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliverSpacerV extends StatelessWidget {
  const SliverSpacerV({super.key, required this.hight});

  final double hight;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(height: hight.h),
    );
  }
}

class SliverSpacerH extends StatelessWidget {
  const SliverSpacerH({super.key, required this.widht});

  final double widht;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(width: widht.w),
    );
  }
}

class SliverSpacerP extends StatelessWidget {
  const SliverSpacerP({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(pinned: true, delegate: MyHeaderDelegate());
  }
}

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: kMainBackground,
      height: 18.h,
    );
  }

  @override
  double get maxExtent => 18.h;

  @override
  double get minExtent => 18.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
