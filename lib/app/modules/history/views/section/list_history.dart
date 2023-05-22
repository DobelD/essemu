import 'package:essemu/app/modules/history/controllers/history_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/decoration/app_radius.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:essemu/app/utils/extension/currency_formatter.dart';
import 'package:essemu/app/utils/extension/date_format.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ListHistory extends StatelessWidget {
  const ListHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryController());
    return SliverPadding(
      padding: DefaultPadding.all,
      sliver: GetBuilder<HistoryController>(builder: (c) {
        return SliverList(
            delegate: SliverChildBuilderDelegate(
                childCount: controller.history.length, (context, index) {
          final data = controller.history[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 8.w),
            child: Container(
              padding: MiddlePadding.all,
              decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: AppRadius.all,
                  border: Border.all(color: kDividerItemSectionDashboard)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(),
                  Expanded(
                    flex: 7,
                    child: SizedBox(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${data.restaurant?.name}',
                          style: AppTextTheme.current.bodyText,
                        ),
                        SizedBox(height: 6.w),
                        Text(
                          '${data.createdAt?.toDateTimeString()}',
                          style: AppTextTheme.current.hintText,
                        )
                      ],
                    )),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '${data.total?.toCurrencyFormat()}',
                      style: AppTextTheme.current.bodyText,
                    ),
                  )
                ],
              ),
            ),
          );
        }));
      }),
    );
  }
}
