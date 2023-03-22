import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:essemu/app/utils/label/label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../components/shimmer/shimmer.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: GetBuilder<HomeController>(builder: (c) {
        return c.loading
            ? LocationLoading()
            : Container(
                padding: EdgeInsets.all(16.w),
                height: 80.h,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: kWhite,
                    border: Border.all(color: kWhite, width: 1.1),
                    image: DecorationImage(
                        image: AssetImage('assets/images/maps.png'),
                        opacity: 0.6,
                        fit: BoxFit.cover)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(IconlyBold.location, color: kMain),
                    SizedBox(width: 12.w),
                    SizedBox(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.deliverTitle,
                          style: AppTextTheme.current.title6,
                        ),
                        // SizedBox(height: 8.h),
                        Text(
                          'Jl. Jendral sudirman no 87',
                          style: AppTextTheme.current.bodyText,
                        ),
                      ],
                    ))
                  ],
                ),
              );
      }),
    ));
  }
}

class LocationLoading extends StatelessWidget {
  const LocationLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(child: AppContentShimmer(hight: 80.h, width: Get.width));
  }
}
