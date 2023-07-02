import 'package:essemu/app/modules/detail_menu/controllers/detail_menu_controller.dart';
import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../data/categories.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key, this.data, required this.fav});
  final Menu? data;
  final bool fav;

  @override
  Widget build(BuildContext context) {
    final ctrlHome = Get.put(HomeController());
    return GetBuilder<DetailMenuController>(builder: (c) {
      bool isMatch =
          ctrlHome.isFavorite.any((favorite) => favorite.menuId == data?.id);
      return SliverAppBar(
        backgroundColor: kWhite,
        surfaceTintColor: kWhite,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            height: 38.w,
            width: 38.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kWhite,
                border: Border.all(
                    color: kDividerItemSectionDashboard, width: 2.1)),
            child: Center(child: Icon(Icons.arrow_back, color: kSoftGrey)),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: GestureDetector(
              onTap: () => c.chengeFavorite(),
              child: Container(
                height: 38.w,
                width: 38.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kWhite,
                    border: Border.all(
                        color: kDividerItemSectionDashboard, width: 2.1)),
                child: Center(
                    child: Icon(
                        c.favorite ? IconlyBold.heart : IconlyLight.heart,
                        color: c.favorite ? kRed : kSoftGrey)),
              ),
            ),
          )
        ],
      );
    });
  }
}
