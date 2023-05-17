import 'package:essemu/app/modules/cart/controllers/cart_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/decoration/app_radius.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ListMenuSection extends StatelessWidget {
  const ListMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (c) {
      return SliverPadding(
          padding: DefaultPadding.all,
          sliver: SliverList(
              delegate:
                  SliverChildBuilderDelegate(childCount: 2, (context, index) {
            return Padding(
                padding: DefaultPadding.down,
                child: Row(
                  children: [
                    Container(
                      height: 102.w,
                      width: 102.w,
                      decoration: BoxDecoration(
                          color: kSoftGrey, borderRadius: AppRadius.all),
                    ),
                    SizedBox(width: 8.w),
                    SizedBox(
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
                                  'Nama Menu',
                                  style: GoogleFonts.inter(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 8.w),
                                Text(
                                  'Rp. ',
                                  style: AppTextTheme.current.hintText,
                                ),
                              ],
                            )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    child: Row(
                                  children: [
                                    GestureDetector(
                                      // onTap: () => c.decrementCounter(data!.price!),
                                      child: Container(
                                          height: 22.w,
                                          width: 22.w,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(color: kMain)),
                                          child: Center(
                                            child: Icon(
                                              Icons.remove,
                                              color: kMain,
                                              size: 12,
                                            ),
                                          )),
                                    ),
                                    Padding(
                                      padding: MiddlePadding.side,
                                      child: Text(
                                        '${c.counter}',
                                        style: GoogleFonts.inter(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    GestureDetector(
                                      // onTap: () => c.incrementCounter(data!.price!),
                                      child: Container(
                                          height: 22.w,
                                          width: 22.w,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(color: kMain)),
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
                                SizedBox(width: 100.w),
                                GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.close,
                                      color: kSoftGrey,
                                      size: 24,
                                    ))
                              ],
                            )
                          ],
                        ))
                  ],
                ));
          })));
    });
  }
}
