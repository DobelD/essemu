import 'package:essemu/app/components/no_data/no_data_menu.dart';
import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/utils/label/label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/label_action/label_action.dart';
import '../widget/shimmer/menu.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: GetBuilder<HomeController>(builder: (c) {
      return c.loading
          ? MenuLoading()
          : c.isLoadMenu
              ? MenuLoading()
              : Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: LabelAction(
                        label: S.menuLabel,
                        isactiveAction: false,
                        onTap: () {},
                      ),
                    ),
                    SizedBox(height: 16.h),
                    c.menu.isNotEmpty
                        ? SizedBox(
                            child: Wrap(
                                direction: Axis.horizontal,
                                children: List.generate(c.menu.length, (index) {
                                  // final data = menu?[index];
                                  return Padding(
                                    padding: EdgeInsets.all(6.w),
                                    child: Container(
                                      height: 200.w,
                                      width: 158.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          color: kWhite),
                                    ),
                                  );
                                })))
                        : NoMenu(),
                  ],
                );
    }));
  }
}
