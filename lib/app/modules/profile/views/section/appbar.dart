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
      leading: Padding(
        padding: EdgeInsets.only(left: 16.w, top: 16.w),
        child: Text(
          'Profile',
          style: AppTextTheme.current.appBarTitleDark,
        ),
      ),
    );
  }
}
