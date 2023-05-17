import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kWhite,
      title: Text('My Cart', style: AppTextTheme.current.appBarTitleDark),
      centerTitle: true,
      leading: Padding(
          padding: DefaultPadding.left,
          child: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(
                IconlyLight.arrow_left,
                color: kBlack,
              ))),
    );
  }
}
