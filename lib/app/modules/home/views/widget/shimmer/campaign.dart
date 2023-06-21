import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../components/shimmer/shimmer.dart';
import '../../../../../themes/decoration/app_padding.dart';

class CampaignLoading extends StatelessWidget {
  const CampaignLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: DefaultPadding.side,
      child:
          AppShimmer(child: AppContentShimmer(hight: 180.h, width: Get.width)),
    );
  }
}
