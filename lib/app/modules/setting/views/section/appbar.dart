import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../themes/typograpy/typo.dart';

class AppBars extends StatelessWidget {
  const AppBars({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leadingWidth: 100.w,
      backgroundColor: kWhite,
      automaticallyImplyLeading: false,
      surfaceTintColor: kWhite,
      pinned: true,
      title: Text(
        'Profile',
        style: AppTextTheme.current.appBarTitleDark,
      ),
      centerTitle: true,
    );
  }
}
