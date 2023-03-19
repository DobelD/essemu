import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/label_action/label_action.dart';
import '../../../../data/categories.dart';
import '../widget/shimmer/menu.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key, this.isLoading = true, this.menu});

  final bool isLoading;
  final List<Menu>? menu;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: isLoading
            ? MenuLoading()
            : GetBuilder<HomeController>(builder: (c) {
                return c.isLoadMenu
                    ? MenuLoading()
                    : Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: LabelAction(
                              label: 'Menu',
                              isactiveAction: false,
                              onTap: () {},
                            ),
                          ),
                          SizedBox(height: 16.h),
                          SizedBox(
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  children:
                                      List.generate(menu?.length ?? 0, (index) {
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
                                  }))),
                        ],
                      );
              }));
  }
}
