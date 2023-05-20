import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../components/shimmer/shimmer.dart';
import '../../../../data/categories.dart';
import '../../../../themes/colors/colors.dart';
import '../../../../utils/assets/svg/svg_assets.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({super.key, this.isLoading = true, this.category});

  final bool isLoading;
  final List<Categories>? category;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomeController());
    List<String> imageAssets = [
      SgAssets.classicCoffe,
      SgAssets.frappe,
      SgAssets.freshDrink,
      SgAssets.mainCourse,
      SgAssets.manualBrew,
      SgAssets.nonCoffee,
      SgAssets.pasta,
      SgAssets.riceBowl,
      SgAssets.signature,
      SgAssets.snack,
      SgAssets.soup,
      SgAssets.western
    ];
    return Material(
      child: SizedBox(
          child: Wrap(
              direction: Axis.horizontal,
              children: List.generate(category?.length ?? 0, (index) {
                final data = category?[index];
                return isLoading
                    ? ItemLoading()
                    : Padding(
                        padding: EdgeInsets.all(6.w),
                        child: Container(
                          height: 110.w,
                          width: 158.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: kDividerItemSectionDashboard),
                              borderRadius: BorderRadius.circular(8.r),
                              color: kPrimary4),
                          child: SizedBox(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.w),
                              child: Column(
                                children: [
                                  SvgPicture.network(
                                    '${c.pubicUrlCategory}${data?.imageUrl}',
                                    height: 55.w,
                                    width: 70.w,
                                  ),
                                  SizedBox(height: 10.w),
                                  Text(
                                    '${data?.name}',
                                    style: AppTextTheme.current.bodyText,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
              }))),
    );
  }
}

class ItemLoading extends StatelessWidget {
  const ItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(6.w),
        child:
            AppShimmer(child: AppContentShimmer(hight: 110.w, width: 158.w)));
  }
}
