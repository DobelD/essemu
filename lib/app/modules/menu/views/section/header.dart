import 'package:flutter/material.dart';

import '../../../../data/categories.dart';
import '../../../../themes/colors/colors.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, this.ctg});

  final Categories? ctg;

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
      color: kMainDark,
      child: Center(
        child: Text(
          'My Header',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
