import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../themes/colors/colors.dart';
import '../../../../themes/typograpy/typo.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
      padding: EdgeInsets.fromLTRB(16.w, 32.w, 16.w, 0),
      height: 270.h,
      width: Get.width,
      color: kMain,
      child: Column(
        children: [
          SizedBox(
              child: Row(
            children: [
              SizedBox(
                  child: Column(
                children: [
                  Text(
                    'Lokasi anda',
                    style: AppTextTheme.current.bodyTextWhite,
                  )
                ],
              ))
            ],
          ))
        ],
      ),
    ));
  }
}
