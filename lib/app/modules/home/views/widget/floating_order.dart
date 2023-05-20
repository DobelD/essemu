import 'package:essemu/app/data/item_order.dart';
import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:essemu/app/modules/home/services/item_order_service.dart';
import 'package:essemu/app/modules/home/services/order_service.dart';
import 'package:essemu/app/modules/home/views/widget/detail_order.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/decoration/app_radius.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:essemu/app/utils/assets/json/json_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class FloatingOrder extends StatelessWidget {
  const FloatingOrder({super.key});

  @override
  Widget build(BuildContext context) {
    OrderService serviceOrder = OrderService();
    ItemOrderService serviceItem = ItemOrderService();
    final controller = Get.put(HomeController());
    // int userId = controller.idUser;
    return StreamBuilder<Map<String, dynamic>>(
        stream: serviceOrder.getData(controller.idUser),
        builder: (context, snap) {
          int idOrder = snap.data?['id'];
          var status = snap.data?['status'] == "proses"
              ? "proses"
              : snap.data?['status'] == "antar"
                  ? "dikirim"
                  : "selesai";
          print(status);
          if (snap.hasData) {
            return GetBuilder<HomeController>(builder: (c) {
              return StreamBuilder<List<ItemOrder>>(
                  stream: serviceItem.getData(idOrder),
                  builder: (context, snaps) {
                    if (snap.data?['id'] == null) {
                      return SizedBox();
                    }
                    return GestureDetector(
                      onTap: () {
                        // controller.getItem(snap.data?['id']);
                        Get.bottomSheet(DetailOrder(
                            data: snaps.data ?? [],
                            status: snap.data?['status']));
                      },
                      child: Container(
                        height: 52.w,
                        width: Get.width * 0.91,
                        padding: MiddlePadding.all,
                        decoration: BoxDecoration(
                            borderRadius: AppRadius.allRounded, color: kMain),
                        child: Row(
                          children: [
                            Container(
                              height: 36.w,
                              width: 36.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: kWhite),
                              child: Center(
                                  child: Text(
                                '1',
                                style: AppTextTheme.current.bodyText,
                              )),
                            ),
                            SizedBox(width: 12.w),
                            // snap.data?['status']=='Sampai'? AnimatedTextKit(
                            //   animatedTexts: [
                            //     RotateAnimatedText(
                            //       'Pesanan sudah sampai...',
                            //       textStyle: AppTextTheme.current.bodyTextWhite,
                            //       textDirection: TextDirection.rtl,
                            //       duration: 4.seconds,
                            //     ),
                            //     RotateAnimatedText(
                            //       'Terima pesanan sekarang!',
                            //       textStyle: AppTextTheme.current.bodyTextWhite,
                            //       textDirection: TextDirection.rtl,
                            //       duration: 4.seconds,
                            //     ),
                            //   ],
                            //   isRepeatingAnimation: true,
                            //   pause: 1.seconds,
                            //   displayFullTextOnTap: true,
                            //   stopPauseOnTap: true,
                            //   repeatForever: true,
                            // ),
                            Text('Pesanan sedang di ${snap.data?['status']}',
                                style: AppTextTheme.current.bodyTextWhite),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 8.w),
                              child: SizedBox(
                                  height: 48.w,
                                  width: 48.w,
                                  child: Lottie.asset(
                                      snap.data?['status'] == 'proses'
                                          ? LtAssets.cooking
                                          : snap.data?['status'] == 'antar'
                                              ? LtAssets.delivery
                                              : LtAssets.done)),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            });
          }
          return SizedBox();
        });
  }
}
