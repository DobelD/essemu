import 'package:dotted_line/dotted_line.dart';
import 'package:essemu/app/modules/order_proccess/controllers/order_proccess_controller.dart';
import 'package:essemu/app/utils/extension/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/item_order.dart';

import '../../../../data/order_rest.dart';
import '../../../../themes/colors/colors.dart';
import '../../../../themes/decoration/app_padding.dart';
import '../../../../themes/typograpy/typo.dart';

class DetailProccessOrder extends StatelessWidget {
  const DetailProccessOrder(
      {super.key,
      required this.user,
      required this.data,
      required this.fee,
      required this.address});

  final Users user;
  final List<ItemOrder> data;
  final int fee;
  final String address;

  @override
  Widget build(BuildContext context) {
    int total = 0;
    int totalBuy = 0 + fee;
    // int deliveryFee = data.first.menu.
    for (var item in data) {
      int price = item.menu.price ?? 0;
      total += item.quantity;
      totalBuy += price * item.quantity;
    }

    return GetBuilder<OrderProccessController>(builder: (c) {
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
              Text('${user.name} - ${user.phone}',
                  style: AppTextTheme.current.bodyText),
              SizedBox(height: 4.w),
              SizedBox(
                  width: Get.width * 0.9,
                  child: Text('${address}',
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextTheme.current.bodyText)),
              SizedBox(height: 6.w),
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
                int totalPrice =
                    data[index].menu.price ?? 0 * data[index].quantity;
                return Padding(
                  padding: EdgeInsets.only(bottom: 8.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text(
                            'x ${data[index].quantity}',
                            style: AppTextTheme.current.bodyText,
                          )),
                      SizedBox(width: 6.w),
                      Expanded(
                          flex: 6,
                          child: Text(
                            '${data[index].menu.name}',
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
        );
      }
    });
  }
}
