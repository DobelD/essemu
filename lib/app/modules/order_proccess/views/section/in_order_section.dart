import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:essemu/app/components/dialog/app_dialog.dart';
import 'package:essemu/app/data/orders.dart';
import 'package:essemu/app/modules/order_proccess/controllers/order_proccess_controller.dart';
import 'package:essemu/app/modules/order_proccess/views/widget/sort_order.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/decoration/app_radius.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:essemu/app/utils/assets/json/json_assets.dart';
import 'package:essemu/app/utils/assets/svg/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../../../../components/bottom_sheet/bottom_sheet.dart';
import '../../../../utils/initialize/notification_initialize.dart';
import '../../services/order_services.dart';
import '../widget/item_order.dart';

class InOrderSection extends StatelessWidget {
  const InOrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    OrderService service = OrderService();
    int currentLenght = 0;

    showNotification(int lenght) {
      print(lenght);
      if (currentLenght == lenght) {
        return; // Jika lenght sama, keluar dari method
      }
      String title = 'Order';
      String body = 'Ada pesanan masuk';
      String summary = 'Pesanan';
      NotificationLayout notificationLayout = NotificationLayout.Inbox;
      NotificationService.createNotification(
        title: title,
        body: body,
        summary: summary,
        notificationLayout: notificationLayout,
      );
      currentLenght = lenght;
    }

    final controller = Get.put(OrderProccessController());
    return Obx(() => StreamBuilder<List<Order>>(
        stream: controller.isPriority.value
            ? service.getDataes(controller.idUser)
            : service.getDatae(controller.idUser),
        builder: (_, snapshot) {
          showNotification(snapshot.data?.length ?? 0);
          List<Order> sortingData = [];
          int count = 0;

          for (Order data in snapshot.data ?? []) {
            if (data.status == "terima") {
              count++;
              sortingData.add(data);
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            controller.isPriority.value
                                ? 'Order by priority'
                                : 'Order by first come',
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
                                      return BSheet(
                                          label: 'Sort order',
                                          child: SortOrder());
                                    },
                                  );
                                },
                              );
                            },
                            child: SvgPicture.asset(
                              SgAssets.sort,
                              height: 18,
                              width: 18,
                              colorFilter:
                                  ColorFilter.mode(kBlack, BlendMode.srcIn),
                            ))
                      ],
                    ),
                  )),
              SliverPadding(
                  padding: DefaultPadding.side,
                  sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: sortingData.length, (context, index) {
                    final data = sortingData[index];
                    Color colorProccess;
                    bool isEnableButton;
                    if (index == 0 && controller.isNextOrder.value == false) {
                      colorProccess = kPrimary1;
                      isEnableButton = true;
                    } else {
                      colorProccess = kGrey3;
                      isEnableButton = false;
                    }
                    Color colorCencel;
                    if (index == 0 && controller.isNextOrder.value == false) {
                      colorCencel = kWarning1;
                    } else {
                      colorCencel = kGrey3;
                    }

                    if (count == 0) {
                      return SizedBox(
                        height: 200.w,
                        width: 200.w,
                        child: Lottie.asset(LtAssets.emptyOrder),
                      );
                    }
                    return Padding(
                      padding: MiddlePadding.down,
                      child: GestureDetector(
                        onTap: () {
                          controller.getItems(data.id);
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
                                    '${data.user.name}',
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
                                        '${data.avgDuration} Minuts Avg Duration',
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
                                              backgroundColor:
                                                  controller.isPriority.value
                                                      ? kWarning1
                                                      : colorCencel,
                                              padding: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.r))),
                                          onPressed: isEnableButton
                                              ? () => Get.dialog(AppDialog(
                                                  isCencel: true,
                                                  onPressed: () => controller
                                                      .toCencel(data.userId)))
                                              : controller.isPriority.value
                                                  ? () => Get.dialog(AppDialog(
                                                      isCencel: true,
                                                      onPressed: () =>
                                                          controller.toCencel(data.userId)))
                                                  : () {},
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
                                              backgroundColor:
                                                  controller.isPriority.value
                                                      ? kPrimary1
                                                      : colorProccess,
                                              padding: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.r))),
                                          onPressed: isEnableButton
                                              ? () => controller
                                                  .toProccess(data.userId)
                                              : controller.isPriority.value
                                                  ? () => controller
                                                      .toProccess(data.userId)
                                                  : () {},
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
        }));
  }
}
