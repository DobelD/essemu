import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:essemu/app/modules/home/services/order_service.dart';
import 'package:essemu/app/routes/app_pages.dart';
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
    final controller = Get.put(HomeController());
    // int userId = controller.idUser;
    return StreamBuilder<Map<String, dynamic>>(
        stream: serviceOrder.getData(controller.idUser),
        builder: (context, snap) {
          print(snap.data?['total_price']);
          if (snap.connectionState == ConnectionState.waiting) {
            return SizedBox();
          }
          if (snap.data!.isNotEmpty) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.DETAIL_ORDER, arguments: {
                  'id_order': snap.data?['id'],
                  'rest': snap.data?['restaurant_id'],
                  'total': snap.data?['total_price'],
                  'fee': snap.data?['delivery_fee']
                });
              },
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1), // Mulai dari bawah
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: const AlwaysStoppedAnimation(1.0),
                  curve: Curves.easeOut, // Animasi muncul dari bawah
                  reverseCurve: Curves.easeIn, // Animasi hilang ke atas
                )),
                child: AnimatedContainer(
                  duration: 2.seconds,
                  child: Container(
                    height: 52.w,
                    width: Get.width * 0.91,
                    padding: MiddlePadding.all,
                    decoration: BoxDecoration(
                        borderRadius: AppRadius.allRounded, color: kMain),
                    child: Row(
                      children: [
                        SizedBox(width: 12.w),
                        Text('Pesanan sedang di ${snap.data?['status']}',
                            style: AppTextTheme.current.bodyTextWhite),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: SizedBox(
                              height: 48.w,
                              width: 48.w,
                              child:
                                  Lottie.asset(snap.data?['status'] == 'proses'
                                      ? LtAssets.cooking
                                      : snap.data?['status'] == 'antar'
                                          ? LtAssets.delivery
                                          : LtAssets.done)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          if (snap.hasError) {
            return SizedBox();
          }
          if (snap.data!.isEmpty) {
            return SizedBox();
          }
          return SizedBox();
        });
  }
}
