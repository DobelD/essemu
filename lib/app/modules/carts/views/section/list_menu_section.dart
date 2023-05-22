import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/decoration/app_radius.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:essemu/app/utils/assets/json/json_assets.dart';
import 'package:essemu/app/utils/extension/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../home/controllers/home_controller.dart';
import '../../controllers/carts_controller.dart';

class ListMenuSection extends StatelessWidget {
  const ListMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    // CartService service = CartService();

    final ctrlHome = Get.put(HomeController());
    return GetBuilder<CartsController>(builder: (c) {
      if (c.isCartEmpty == false) {
        return SliverPadding(
            padding: DefaultPadding.all,
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                    childCount: c.cartOrder.length, (context, index) {
              final data = c.cartOrder[index];
              final price = data.menu.price ?? 0 * data.qty;
              int subTotal = 0;
              for (var item in c.cartOrder) {
                subTotal += item.menu.price! * item.qty;
              }
              for (var item in c.cartOrder) {
                c.listQty.add(item.qty);
              }

              return Padding(
                  padding: DefaultPadding.down,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 102.w,
                          width: 102.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage('')),
                              color: kSoftGrey,
                              borderRadius: AppRadius.all),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        flex: 7,
                        child: SizedBox(
                            height: 98.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${data.menu.name}',
                                      style: GoogleFonts.inter(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 8.w),
                                    Text(
                                      '${price.toCurrencyFormat()}',
                                      style: AppTextTheme.current.hintText,
                                    ),
                                  ],
                                )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () => c.counterItemDecrement(
                                              ctrlHome.idUser,
                                              data.menu.id ?? 0,
                                              data.qty),
                                          child: Container(
                                              height: 22.w,
                                              width: 22.w,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border:
                                                      Border.all(color: kMain)),
                                              child: Center(
                                                child: Icon(
                                                  Icons.remove,
                                                  color: kMain,
                                                  size: 12,
                                                ),
                                              )),
                                        ),
                                        Padding(
                                          padding: DefaultPadding.side,
                                          child: Text(
                                            '${data.qty}',
                                            style:
                                                AppTextTheme.current.bodyText,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () => c.counterItemIncerement(
                                              ctrlHome.idUser,
                                              data.menu.id ?? 0,
                                              data.qty),
                                          child: Container(
                                              height: 22.w,
                                              width: 22.w,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border:
                                                      Border.all(color: kMain)),
                                              child: Center(
                                                child: Icon(
                                                  Icons.add,
                                                  color: kMain,
                                                  size: 12,
                                                ),
                                              )),
                                        )
                                      ],
                                    )),
                                    GestureDetector(
                                        onTap: () => c.deleteData(
                                            ctrlHome.idUser, data.menuId),
                                        child: Icon(
                                          Icons.close,
                                          color: kSoftGrey,
                                          size: 20,
                                        )),
                                  ],
                                )
                              ],
                            )),
                      )
                    ],
                  ));
            })));
      } else {
        return SliverToBoxAdapter(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 300.w,
                width: 300.w,
                child: Lottie.asset(LtAssets.empty)),
            SizedBox(height: 12.w),
            Text('Please select a menu to order!',
                style: AppTextTheme.current.bodyText)
          ],
        ));
      }
    });
  }
}
