import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../components/shimmer/shimmer.dart';

class SearchLoading extends StatelessWidget {
  const SearchLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(child: AppContentShimmer(hight: 46.h, width: Get.width));
  }
}
