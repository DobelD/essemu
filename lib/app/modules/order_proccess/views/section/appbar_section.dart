import 'package:essemu/app/modules/order_proccess/controllers/order_proccess_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderProccessController());
    return SliverAppBar(
      backgroundColor: kWhite,
      toolbarHeight: 10.w,
      bottom: TabBar(
          controller: controller.controlTabs,
          unselectedLabelColor: kGrey2,
          labelColor: kBlack,
          labelStyle: AppTextTheme.current.bodyText,
          labelPadding: EdgeInsets.only(bottom: 6.w),
          tabs: [
            Text('In Order'),
            Text('On Proccess'),
          ]),
    );
  }
}
