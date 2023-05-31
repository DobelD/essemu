import 'package:essemu/app/modules/order_proccess/controllers/order_proccess_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:essemu/app/utils/assets/svg/svg_assets.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SortOrder extends StatelessWidget {
  const SortOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderProccessController>(builder: (c) {
      return Column(
        children: [
          GestureDetector(
              onTap: () => c.sortOrder('first'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'First Come',
                    style: c.isPriority.value
                        ? AppTextTheme.current.unselectedFilter
                        : AppTextTheme.current.selectedFilter,
                  ),
                  SizedBox(
                      child: SvgPicture.asset(
                    SgAssets.comingSoon,
                    height: 20,
                    width: 20,
                    colorFilter: ColorFilter.mode(
                        c.isPriority.value ? kBlack : kPrimary1,
                        BlendMode.srcIn),
                  ))
                ],
              )),
          SizedBox(height: 22.w),
          GestureDetector(
              onTap: () => c.sortOrder('priority'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Priority',
                    style: c.isPriority.value
                        ? AppTextTheme.current.selectedFilter
                        : AppTextTheme.current.unselectedFilter,
                  ),
                  SizedBox(
                      child: SvgPicture.asset(
                    SgAssets.priority,
                    height: 20,
                    width: 20,
                    colorFilter: ColorFilter.mode(
                        c.isPriority.value ? kPrimary1 : kBlack,
                        BlendMode.srcIn),
                  ))
                ],
              )),
          SizedBox(height: 32.w),
        ],
      );
    });
  }
}
