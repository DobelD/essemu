import 'package:dotted_line/dotted_line.dart';
import 'package:essemu/app/modules/comfirm_order/controllers/comfirm_order_controller.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/utils/extension/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../themes/colors/colors.dart';
import '../../../../themes/typograpy/typo.dart';

class ItemSection extends StatelessWidget {
  const ItemSection({super.key, required this.fee});

  final int fee;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ComfirmOrderController());

    return SliverToBoxAdapter(
        child: Padding(
      padding: MiddlePadding.up,
      child: Container(
        color: kWhite,
        padding: DefaultPadding.all,
        child: GetBuilder<ComfirmOrderController>(builder: (c) {
          final items = controller.items;
          int total = 0;
          int totalBuy = 0 + fee;
          // int deliveryFee = data.first.menu.
          for (var item in items) {
            int price = item.menu.price ?? 0;
            total += item.quantity;
            totalBuy += price * item.quantity;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Detail Pesanan', style: AppTextTheme.current.bodyText),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.w),
                child: DottedLine(
                  direction: Axis.horizontal,
                  lineLength: Get.width * 0.9,
                  lineThickness: 1.0,
                  dashColor: kGrey2,
                ),
              ),
              SizedBox(
                  child: Column(
                      children: List.generate(c.items.length, (index) {
                int totalPrice =
                    c.items[index].menu.price ?? 0 * items[index].quantity;
                return Padding(
                  padding: EdgeInsets.only(bottom: 8.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text(
                            'x ${items[index].quantity}',
                            style: AppTextTheme.current.bodyText,
                          )),
                      SizedBox(width: 6.w),
                      Expanded(
                          flex: 7,
                          child: Text(
                            '${items[index].menu.name}',
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
                  lineLength: Get.width * 0.9,
                  lineThickness: 1.0,
                  dashColor: kGrey2,
                ),
              ),
              Row(
                children: [
                  Expanded(
                      flex: 8,
                      child: Text(
                        'Delivery fee',
                        style: AppTextTheme.current.bodyText,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Expanded(
                      flex: 3,
                      child: Text(
                        '${fee.toCurrencyFormat()}',
                        style: AppTextTheme.current.bodyText,
                      ))
                ],
              ),
              SizedBox(height: 12.w),
              Row(
                children: [
                  Expanded(
                      flex: 8,
                      child: Text(
                        'Total',
                        style: AppTextTheme.current.bodyText,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Expanded(
                      flex: 3,
                      child: Text(
                        '${totalBuy.toCurrencyFormat()}',
                        style: AppTextTheme.current.bodyText,
                      ))
                ],
              ),
              SizedBox(height: 32.w)
            ],
          );
        }),
      ),
    ));
  }
}
