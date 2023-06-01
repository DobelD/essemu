import 'package:dotted_line/dotted_line.dart';
import 'package:essemu/app/data/order.dart';
import 'package:essemu/app/modules/detail_order/controllers/detail_order_controller.dart';
import 'package:essemu/app/modules/detail_order/views/widget/phone.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/decoration/app_radius.dart';
import 'package:essemu/app/utils/assets/svg/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import '../../../../themes/typograpy/typo.dart';
import '../../../../utils/extension/status_mesaage.dart';

class StatusSection extends StatelessWidget {
  const StatusSection({super.key, required this.fee});
  final int fee;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailOrderController());
    return StreamBuilder<Order>(
        stream: controller.orders,
        builder: (context, snapshot) {
          final Order? data = snapshot.data;
          final status = data?.status;
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
            controller.courierName.clear();
            controller.statusName.clear();
            controller.courierName.add(data.courier!.name!);
            controller.statusName.add(status!);
            print(controller.status);
            print(controller.courierName);
            print(controller.statusName);

            return Column(
              children: [
                Container(
                  height: 58.w,
                  width: Get.width,
                  decoration:
                      BoxDecoration(color: kBlack, borderRadius: AppRadius.top),
                  child: ListTile(
                    tileColor: kBlack,
                    focusColor: kBlack,
                    shape: RoundedRectangleBorder(
                        borderRadius: AppRadius.allRounded),
                    leading: Container(
                      height: 42.w,
                      width: 42.w,
                      decoration:
                          BoxDecoration(color: kGrey2, shape: BoxShape.circle),
                      child: Center(
                          child: SvgPicture.asset(
                        SgAssets.courier,
                        height: 32,
                        width: 32,
                      )),
                    ),
                    title: Text(
                      data.courierId != 0
                          ? '${data.courier?.name}'
                          : "Haven't found a courier",
                      style: AppTextTheme.current.bodyTextWhite,
                    ),
                    subtitle: Text(
                      data.courierId != 0
                          ? '0${data.courier?.phone}'
                          : 'your order has not been shipped',
                      style: AppTextTheme.current.hintText,
                    ),
                    trailing: GestureDetector(
                        onTap: data.courierId != 0
                            ? () {
                                DirectToPhone.direct('${data.courier?.phone}');
                              }
                            : () {},
                        child: Icon(
                          IconlyBold.call,
                          color: data.courierId != 0 ? kSuccess1 : kGrey1,
                        )),
                  ),
                ),
                SizedBox(height: 12.w),
                Container(
                    padding: DefaultPadding.all,
                    decoration: BoxDecoration(
                        color: kWhite, borderRadius: AppRadius.top),
                    child: Column(
                      children: [
                        Text(
                            status == 'terima' || status == 'tolak'
                                ? 'Estimated delivery time is not specified'
                                : 'Estimated delivery time is $formattedTimeDelivery PM',
                            style: AppTextTheme.current.bodyText),
                        SizedBox(height: 6.w),
                        Text(
                            status == 'terima'
                                ? StatusMessage.terima.text
                                : status == 'proses'
                                    ? StatusMessage.proses.text
                                    : status == 'antar'
                                        ? StatusMessage.antar.text
                                        : status == 'selesai'
                                            ? StatusMessage.selesai.text
                                            : StatusMessage.tolak.text,
                            style: GoogleFonts.inter(
                                fontSize: 12,
                                color:
                                    status != 'tolak' ? kSuccess1 : kWarning1)),
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
                    )),
              ],
            );
          }
          return SizedBox();
        });
  }
}
