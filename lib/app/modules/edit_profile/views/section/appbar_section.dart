import 'package:flutter/material.dart';

import '../../../../themes/colors/colors.dart';
import '../../../../themes/typograpy/typo.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kWhite,
      automaticallyImplyLeading: false,
      surfaceTintColor: kWhite,
      pinned: true,
      title: Text(
        'Edit Profile',
        style: AppTextTheme.current.appBarTitleDark,
      ),
      centerTitle: true,
    );
  }
}
