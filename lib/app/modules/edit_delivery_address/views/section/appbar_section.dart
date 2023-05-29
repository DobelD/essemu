import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kWhite,
      title: Text('Edit Delivery Address',
          style: AppTextTheme.current.appBarTitleDark),
      centerTitle: true,
    );
  }
}
