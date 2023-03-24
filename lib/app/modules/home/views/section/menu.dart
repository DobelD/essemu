import 'package:essemu/app/components/no_data/no_data_menu.dart';
import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/utils/label/label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/label_action/label_action.dart';
import '../../../../themes/decoration/app_radius.dart';
import '../widget/shimmer/menu.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
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
                            child: GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: c.menu.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.79,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12),
                            itemBuilder: (context, index) {
                              return Container(
                                height: 200,
                                width: 158,
                                decoration: BoxDecoration(
                                    color: kWhite,
                                    borderRadius: AppRadius.all,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            '${c.images[index]}'))),
                              );
                            },
                          ))
                        : NoMenu(),
                    SizedBox(height: 16.h),
                  ],
                );
    }));
  }
}
