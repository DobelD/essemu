import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/assets/images/image_assets.dart';

class BackgroundSection extends StatelessWidget {
  const BackgroundSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
      height: Get.height * 0.8,
      width: Get.width,
      decoration: BoxDecoration(
          color: kBlack,
          image: DecorationImage(
              image: AssetImage(ImgAssets.backgroung),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  kWhite.withOpacity(0.7), BlendMode.srcATop))),
    ));
  }
}
