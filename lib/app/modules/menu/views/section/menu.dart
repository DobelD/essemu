import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../themes/colors/colors.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
            children: List.generate(20, (index) {
      return Container(height: 100.h, width: Get.width, color: kMain);
    })));
  }
}
