import 'package:essemu/app/components/dialog/app_dialog.dart';
import 'package:essemu/app/utils/extension/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../../../../components/bottom_sheet/bottom_sheet.dart';
import '../../../../themes/colors/colors.dart';
import '../../../../themes/decoration/app_padding.dart';
import '../../../../themes/decoration/app_radius.dart';
import '../../../../themes/typograpy/typo.dart';
import '../../controllers/order_proccess_controller.dart';
import '../widget/proccess_item.dart';

class OnDelivery extends StatelessWidget {
  const OnDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderProccessController());
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(1.seconds, () {
          controller.getOrderDeliver();
        });
      },
      child: CustomScrollView(
        slivers: [
          SliverPadding(
              padding: DefaultPadding.all,
              sliver: GetBuilder<OrderProccessController>(builder: (c) {
                return SliverList(
                    delegate: SliverChildBuilderDelegate(
                        childCount: controller.deliveryOrder.length,
                        (context, index) {
                  final data = controller.deliveryOrder[index];
                  return Padding(
                    padding: MiddlePadding.down,
                    child: GestureDetector(
                      onTap: () {
                        controller.getItems(data.id!);
                        Future.delayed(600.milliseconds, () {
                          showSlidingBottomSheet(
                            context,
                            builder: (BuildContext context) {
                              return SlidingSheetDialog(
                                elevation: 8,
                                cornerRadius: 8.r,
                                snapSpec: const SnapSpec(
                                  snap: true,
                                  snappings: [1.0],
                                  positioning:
                                      SnapPositioning.relativeToAvailableSpace,
                                ),
                                builder: (context, state) {
                                  return BSheet(
                                      isLabel: true,
                                      label: 'Detail Pesanan',
                                      child: DetailProccessOrder(
                                        user: data.users!,
                                        data: controller.items,
                                        fee: data.deliveryFee!,
                                        address: data.address!,
                                      ));
                                },
                              );
                            },
                          );
                        });
                      },
                      child: Container(
                        padding: MiddlePadding.all,
                        decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: AppRadius.all,
                            border: Border.all(
                                color: kDividerItemSectionDashboard)),
                        child: Row(
                          children: [
                            Container(
                              height: 32.w,
                              width: 32.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: kPrimary3),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${data.users!.name}',
                                  style: AppTextTheme.current.bodyText,
                                ),
                                SizedBox(height: 4.w),
                                Text(
                                  '${data.totalPrice!.toCurrencyFormat()}',
                                  style: AppTextTheme.current.hintText,
                                ),
                              ],
                            )),
                            SizedBox(
                                height: 32.w,
                                width: 100.w,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: kSuccess1,
                                        padding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.r))),
                                    onPressed: () => Get.dialog(AppDialog(
                                        isDone: true,
                                        onPressed: () => controller
                                            .updateStatusDone(data.userId!))),
                                    child: Center(
                                        child: Text(
                                      'Done',
                                      style: GoogleFonts.inter(
                                          fontSize: 12, color: kWhite),
                                    ))))
                          ],
                        ),
                      ),
                    ),
                  );
                }));
              }))
        ],
      ),
    );
  }
}
