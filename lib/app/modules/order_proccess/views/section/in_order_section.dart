import 'package:essemu/app/components/dialog/app_dialog.dart';
import 'package:essemu/app/data/orders.dart';
import 'package:essemu/app/modules/order_proccess/controllers/order_proccess_controller.dart';
import 'package:essemu/app/modules/order_proccess/views/widget/sort_order.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/decoration/app_radius.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:essemu/app/utils/assets/json/json_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../../../../components/bottom_sheet/bottom_sheet.dart';
import '../../services/order_services.dart';
import '../widget/item_order.dart';

class InOrderSection extends StatelessWidget {
  const InOrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    OrderService service = OrderService();

    final controller = Get.put(OrderProccessController());
    return StreamBuilder<List<Order>>(
        stream: service.getDatae(controller.idUser),
        builder: (_, snapshot) {
          int count = 0;
          for (Order data in snapshot.data ?? []) {
            if (data.status == "terima") {
              count++;
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return CustomScrollView(
            slivers: [
              SliverPadding(
                  padding: DefaultPadding.all,
                  sliver: SliverToBoxAdapter(
                    child: GetBuilder<OrderProccessController>(builder: (c) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('List Order by id',
                              style: AppTextTheme.current.bodyText),
                          GestureDetector(
                              onTap: () {
                                showSlidingBottomSheet(
                                  context,
                                  builder: (BuildContext context) {
                                    return SlidingSheetDialog(
                                      elevation: 8,
                                      cornerRadius: 8.r,
                                      snapSpec: const SnapSpec(
                                        snap: true,
                                        snappings: [1.0],
                                        positioning: SnapPositioning
                                            .relativeToAvailableSpace,
                                      ),
                                      builder: (context, state) {
                                        return SortOrder();
                                      },
                                    );
                                  },
                                );
                              },
                              child: Icon(IconlyBold.filter_2))
                        ],
                      );
                    }),
                  )),
              SliverPadding(
                  padding: DefaultPadding.side,
                  sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: snapshot.data?.length, (context, index) {
                    final data = snapshot.data?[index];
                    if (snapshot.data![index].status != "terima") {
                      return SizedBox();
                    }
                    if (count < 1) {
                      return Center(
                          child: SizedBox(
                        height: 200.w,
                        width: 200.w,
                        child: Lottie.asset(LtAssets.emptyOrder),
                      ));
                    }
                    return Padding(
                      padding: MiddlePadding.down,
                      child: GestureDetector(
                        onTap: () {
                          controller.getItems(data!.id);
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
                                    positioning: SnapPositioning
                                        .relativeToAvailableSpace,
                                  ),
                                  builder: (context, state) {
                                    return BSheet(
                                        isLabel: true,
                                        label: 'Detail Pesanan',
                                        child: DetailItemOrder(
                                          user: data.user,
                                          data: controller.items,
                                          fee: data.deliveryFee,
                                          address: data.address,
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
                                    '${data?.user.name}',
                                    style: AppTextTheme.current.bodyText,
                                  ),
                                  SizedBox(height: 4.w),
                                  Row(
                                    children: [
                                      Icon(
                                        IconlyLight.time_circle,
                                        color: kGrey2,
                                        size: 13,
                                      ),
                                      SizedBox(width: 4.w),
                                      Text(
                                        '${data?.avgDuration} Minuts Avg Duration',
                                        style: AppTextTheme
                                            .current.highlightsBodyHint,
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                              Row(
                                children: [
                                  SizedBox(
                                      height: 32.w,
                                      width: 42.w,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: kWarning1,
                                              padding: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.r))),
                                          onPressed: () => Get.dialog(AppDialog(
                                              isCencel: true,
                                              onPressed: () => controller
                                                  .toCencel(data!.userId))),
                                          child: Center(
                                              child: Icon(
                                            IconlyLight.close_square,
                                            color: kWhite,
                                            size: 18,
                                          )))),
                                  SizedBox(width: 8.w),
                                  SizedBox(
                                      height: 32.w,
                                      width: 42.w,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: kPrimary1,
                                              padding: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.r))),
                                          onPressed: () => controller
                                              .toProccess(data!.userId),
                                          child: Center(
                                              child: Icon(
                                            IconlyLight.arrow_right_square,
                                            color: kWhite,
                                            size: 18,
                                          ))))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })))
            ],
          );
        });
  }
}
