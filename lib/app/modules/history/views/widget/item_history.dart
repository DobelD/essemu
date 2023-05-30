import 'package:dotted_line/dotted_line.dart';
import 'package:essemu/app/modules/history/controllers/history_controller.dart';
import 'package:essemu/app/utils/extension/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/history_item.dart';

import '../../../../themes/colors/colors.dart';
import '../../../../themes/decoration/app_padding.dart';
import '../../../../themes/typograpy/typo.dart';

class DetailItemHistory extends StatelessWidget {
  const DetailItemHistory({super.key, required this.data});

  final List<HistoryItem> data;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(builder: (c) {
      if (c.isLoading) {
        return SizedBox(
          height: 120.w,
          child: Center(
            child: SizedBox(
                height: 32.w,
                width: 32.w,
                child: CircularProgressIndicator(
                  color: kPrimary1,
                )),
          ),
        );
      } else {
        return Padding(
          padding: DefaultPadding.side,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.w),
                child: DottedLine(
                  direction: Axis.horizontal,
                  lineLength: Get.width * 0.82,
                  lineThickness: 1.0,
                  dashColor: kGrey2,
                ),
              ),
              SizedBox(
                  child: Column(
                      children: List.generate(data.length, (index) {
                int totalPrice = data[index].menu!.price! * data[index].qty!;
                return Padding(
                  padding: EdgeInsets.only(bottom: 8.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text(
                            'x ${data[index].qty}',
                            style: AppTextTheme.current.bodyText,
                          )),
                      SizedBox(width: 6.w),
                      Expanded(
                          flex: 6,
                          child: Text(
                            '${data[index].menu?.name}',
                            style: AppTextTheme.current.bodyText,
                          )),
                      SizedBox(width: 6.w),
                      Expanded(
                          flex: 3,
                          child: Text(
                            '${totalPrice.toCurrencyFormat()}',
                            style: AppTextTheme.current.bodyText,
                          ))
                    ],
                  ),
                );
              }))),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.w),
                child: DottedLine(
                  direction: Axis.horizontal,
                  lineLength: Get.width * 0.82,
                  lineThickness: 1.0,
                  dashColor: kGrey2,
                ),
              ),
              SizedBox(height: 32.w)
            ],
          ),
        );
      }
    });
  }
}
