import 'package:dotted_line/dotted_line.dart';
import 'package:essemu/app/data/item_order.dart';
import 'package:essemu/app/modules/detail_order/controllers/detail_order_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/utils/extension/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../themes/typograpy/typo.dart';

class ItemSection extends StatelessWidget {
  const ItemSection({super.key, required this.id, required this.fee});
  final int id;
  final int fee;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailOrderController());
    final List<ItemOrder>? data = controller.itemOrder;
    int total = 0;
    int totalBuy = 0 + fee;
    // int deliveryFee = data.first.menu.
    if (data != null) {
      for (var item in data) {
        int price = item.menu.price ?? 0;
        total += item.quantity;
        totalBuy += price * item.quantity;
      }
    }
    return Material(
      color: Colors.transparent,
      child: Container(
        color: kWhite,
        padding: DefaultPadding.side,
        child: ExpansionTile(
          iconColor: kBlack,
          collapsedIconColor: kBlack,
          collapsedBackgroundColor: kWhite,
          tilePadding: EdgeInsets.zero,
          initiallyExpanded: false,
          collapsedShape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.transparent)),
          title: Text('Detail Pesanan', style: AppTextTheme.current.buttonText),
          children: [
            Column(
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
                        children:
                            List.generate(controller.itemOrder.length, (index) {
                  int totalPrice = controller.itemOrder[index].menu.price ??
                      0 * controller.itemOrder[index].quantity;

                  return Padding(
                    padding: EdgeInsets.only(bottom: 8.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              'x ${data?[index].quantity}',
                              style: AppTextTheme.current.bodyText,
                            )),
                        SizedBox(width: 6.w),
                        Expanded(
                            flex: 6,
                            child: Text(
                              '${data?[index].menu.name}',
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
                Row(
                  children: [
                    Expanded(
                        flex: 7,
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
                        flex: 6,
                        child: Text(
                          'Total',
                          style: AppTextTheme.current.bodyText,
                          overflow: TextOverflow.ellipsis,
                        )),
                    Expanded(
                        flex: 1,
                        child: Text(
                          '${total}',
                          style: AppTextTheme.current.bodyText,
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
            ),
          ],
        ),
      ),
    );
  }
}
