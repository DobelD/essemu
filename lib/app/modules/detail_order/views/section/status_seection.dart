import 'package:dotted_line/dotted_line.dart';
import 'package:essemu/app/data/order.dart';
import 'package:essemu/app/modules/detail_order/controllers/detail_order_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/decoration/app_radius.dart';
import 'package:essemu/app/utils/assets/svg/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../themes/typograpy/typo.dart';

class StatusSection extends StatelessWidget {
  const StatusSection({super.key, required this.fee});
  final int fee;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailOrderController());
    return SliverPadding(
      padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 0),
      sliver: SliverToBoxAdapter(
          child: StreamBuilder<Order>(
              stream: controller.orders,
              builder: (context, snapshot) {
                final Order? data = snapshot.data;
                final status = data?.status;
                controller.status = data?.status ?? '';
                controller.setStatus(data?.status);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox();
                }
                if (snapshot.hasError) {
                  return SizedBox();
                }
                if (data == null) {
                  return SizedBox();
                }

                double deliveryDuration = fee / 2000;
                double estimatedDeliver = deliveryDuration + data.avgDuration;
                int originalTimestamp = data.orderDate;
                double durationMinutes = estimatedDeliver;
                int durationSeconds = (durationMinutes * 60).round();
                int millisecondsToAdd = durationSeconds * 1000;
                int newTimestamp = originalTimestamp + millisecondsToAdd;
                DateTime origin =
                    DateTime.fromMillisecondsSinceEpoch(originalTimestamp);
                DateTime timesDelivery =
                    DateTime.fromMillisecondsSinceEpoch(newTimestamp);
                String formattedTimeOrigin =
                    '${origin.hour.toString().padLeft(2, '0')}:${origin.minute.toString().padLeft(2, '0')}';
                String formattedTimeDelivery =
                    '${timesDelivery.hour.toString().padLeft(2, '0')}:${timesDelivery.minute.toString().padLeft(2, '0')}';
                print(formattedTimeOrigin);
                print(formattedTimeDelivery);

                if (snapshot.hasData) {
                  return Container(
                      padding: DefaultPadding.all,
                      decoration: BoxDecoration(
                          color: kWhite, borderRadius: AppRadius.all),
                      child: Column(
                        children: [
                          Text(
                              'Estimated delivery time is $formattedTimeDelivery PM',
                              style: AppTextTheme.current.bodyText),
                          SizedBox(height: 16.w),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 22.w,
                                  width: 32.w,
                                  child: SvgPicture.asset(
                                    SgAssets.receipt,
                                    colorFilter: ColorFilter.mode(
                                        status == "tolak" ? kRed : kSuccess1,
                                        BlendMode.srcIn),
                                  )),
                              SizedBox(width: 6.w),
                              DottedLine(
                                direction: Axis.horizontal,
                                lineLength: 30,
                                lineThickness: 2.0,
                                dashColor: status == "proses" ||
                                        status == "antar" ||
                                        status == "selesai"
                                    ? kSuccess1
                                    : status == "tolak"
                                        ? kRed
                                        : kGrey2,
                              ),
                              SizedBox(width: 6.w),
                              SizedBox(
                                  height: 22.w,
                                  width: 32.w,
                                  child: SvgPicture.asset(
                                    SgAssets.cooking,
                                    colorFilter: ColorFilter.mode(
                                        status == "proses" ||
                                                status == "antar" ||
                                                status == "selesai"
                                            ? kSuccess1
                                            : status == "tolak"
                                                ? kRed
                                                : kGrey2,
                                        BlendMode.srcIn),
                                  )),
                              SizedBox(width: 6.w),
                              DottedLine(
                                direction: Axis.horizontal,
                                lineLength: 30,
                                lineThickness: 2.0,
                                dashColor:
                                    status == "antar" || status == "selesai"
                                        ? kSuccess1
                                        : status == "tolak"
                                            ? kRed
                                            : kGrey2,
                              ),
                              SizedBox(width: 6.w),
                              SizedBox(
                                  height: 22.w,
                                  width: 32.w,
                                  child: SvgPicture.asset(
                                    SgAssets.motorbike,
                                    colorFilter: ColorFilter.mode(
                                        status == "antar" || status == "selesai"
                                            ? kSuccess1
                                            : status == "tolak"
                                                ? kRed
                                                : kGrey2,
                                        BlendMode.srcIn),
                                  )),
                              SizedBox(width: 6.w),
                              DottedLine(
                                direction: Axis.horizontal,
                                lineLength: 30,
                                lineThickness: 2.0,
                                dashColor: status == "selesai"
                                    ? kSuccess1
                                    : status == "tolak"
                                        ? kRed
                                        : kGrey2,
                              ),
                              SizedBox(width: 6.w),
                              SizedBox(
                                  height: 22.w,
                                  width: 32.w,
                                  child: SvgPicture.asset(
                                    status == "tolak"
                                        ? SgAssets.cancel
                                        : SgAssets.tick,
                                    colorFilter: ColorFilter.mode(
                                        status == "selesai"
                                            ? kSuccess1
                                            : status == "tolak"
                                                ? kRed
                                                : kGrey2,
                                        BlendMode.srcIn),
                                  )),
                            ],
                          ),
                        ],
                      ));
                }
                return SizedBox();
              })),
    );
  }
}
