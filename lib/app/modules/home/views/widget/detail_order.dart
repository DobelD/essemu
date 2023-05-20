import 'package:dotted_line/dotted_line.dart';
import 'package:essemu/app/components/button/app_button_primary.dart';
import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/item_order.dart';

class DetailOrder extends StatelessWidget {
  const DetailOrder({super.key, required this.data, required this.status});

  final List<ItemOrder> data;
  final String status;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    String statusNow = status == "proses"
        ? "Your order is already proccess"
        : status == "antar"
            ? "Your order is already on its way to you"
            : "Your order has arrived";
    return ConstrainedBox(
      constraints:
          BoxConstraints(minHeight: Get.height * 0.2, maxHeight: Get.height),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            color: kMain,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14.r),
                topRight: Radius.circular(14.r))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(22),
                  child: Column(
                    children: [
                      Text('Estimated delivery time is 16:18 PM',
                          style: AppTextTheme.current.bodyTextWhite),
                      SizedBox(height: 2.w),
                      Text('${statusNow}',
                          style: AppTextTheme.current.hintText),
                    ],
                  )),
              Divider(
                color: kSoftBlack,
                height: 0,
              ),
              Padding(
                  padding: EdgeInsets.all(22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home, color: kSuccess1),
                      SizedBox(width: 6.w),
                      DottedLine(
                        direction: Axis.horizontal,
                        lineLength: 30,
                        lineThickness: 1.0,
                        dashColor: status == "proses" ||
                                status == "antar" ||
                                status == "selesai"
                            ? kSuccess1
                            : kGrey2,
                      ),
                      SizedBox(width: 6.w),
                      Icon(Icons.home,
                          color: status == "proses" ||
                                  status == "antar" ||
                                  status == "selesai"
                              ? kSuccess1
                              : kGrey2),
                      SizedBox(width: 6.w),
                      DottedLine(
                        direction: Axis.horizontal,
                        lineLength: 30,
                        lineThickness: 1.0,
                        dashColor: status == "antar" ||
                                status == "antar" ||
                                status == "selesai"
                            ? kSuccess1
                            : kGrey2,
                      ),
                      SizedBox(width: 6.w),
                      Icon(Icons.home,
                          color: status == "antar" ||
                                  status == "antar" ||
                                  status == "selesai"
                              ? kSuccess1
                              : kGrey2),
                      SizedBox(width: 6.w),
                      DottedLine(
                        direction: Axis.horizontal,
                        lineLength: 30,
                        lineThickness: 1.0,
                        dashColor: status == "selesai" ||
                                status == "antar" ||
                                status == "selesai"
                            ? kSuccess1
                            : kGrey2,
                      ),
                      SizedBox(width: 6.w),
                      Icon(Icons.home,
                          color: status == "selesai" ||
                                  status == "antar" ||
                                  status == "selesai"
                              ? kSuccess1
                              : kGrey2),
                    ],
                  )),
              Divider(
                color: kSoftBlack,
                height: 0,
              ),
              Padding(
                  padding: DefaultPadding.all,
                  child: Column(
                    children: [
                      SizedBox(
                          child: Column(
                              children: List.generate(
                                  data.length,
                                  (index) => Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(16, 0, 16, 8),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 6,
                                                child: Text(
                                                  '${data[index].menu.name}',
                                                  style: AppTextTheme
                                                      .current.bodyTextWhite,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )),
                                            Expanded(
                                                flex: 1,
                                                child: Text(
                                                  'x ${data[index].quantity}',
                                                  style: AppTextTheme
                                                      .current.bodyTextWhite,
                                                )),
                                            Expanded(
                                                flex: 3,
                                                child: Text(
                                                  'Rp. ${data[index].pricePerItem * data[index].quantity}',
                                                  style: AppTextTheme
                                                      .current.bodyTextWhite,
                                                ))
                                          ],
                                        ),
                                      )))),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.w),
                        child: DottedLine(
                          direction: Axis.horizontal,
                          lineLength: Get.width * 0.82,
                          lineThickness: 1.0,
                          dashColor: kGrey2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 6,
                                child: Text(
                                  'Total',
                                  style: AppTextTheme.current.bodyTextWhite,
                                  overflow: TextOverflow.ellipsis,
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  '5',
                                  style: AppTextTheme.current.bodyTextWhite,
                                )),
                            Expanded(
                                flex: 3,
                                child: Text(
                                  'Rp. 50.000',
                                  style: AppTextTheme.current.bodyTextWhite,
                                ))
                          ],
                        ),
                      )
                    ],
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.w),
                child: SizedBox(
                  height: 42.w,
                  width: Get.width,
                  child: AppButtonPrimary(
                    label: 'Selesai',
                    invert: true,
                    onPressed: () {
                      Get.back();
                      controller.onOrderDone();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
