import 'package:essemu/app/modules/order_proccess/controllers/order_proccess_controller.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                ],
              )),
          SizedBox(height: 12.w),
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
                ],
              )),
          SizedBox(height: 22.w),
        ],
      );
    });
  }
}
