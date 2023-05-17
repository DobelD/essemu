import 'package:essemu/app/components/button/app_button_primary.dart';
import 'package:essemu/app/modules/detail_menu/controllers/detail_menu_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../data/categories.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key, this.data});
  final Menu? data;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailMenuController>(builder: (c) {
      return Container(
        height: 146.w,
        width: Get.width,
        padding: DefaultPadding.all,
        decoration: BoxDecoration(color: kWhite),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: GoogleFonts.inter(
                            fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 4.w),
                      Text(
                        'Rp. ${c.price}',
                        style: GoogleFonts.inter(
                            fontSize: 18.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => c.decrementCounter(data!.price!),
                      child: Container(
                          height: 32.w,
                          width: 32.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: kMain)),
                          child: Center(
                            child: Icon(
                              Icons.remove,
                              color: kMain,
                            ),
                          )),
                    ),
                    Padding(
                      padding: DefaultPadding.side,
                      child: Text(
                        '${c.counter}',
                        style: GoogleFonts.inter(
                            fontSize: 18.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => c.incrementCounter(data!.price!),
                      child: Container(
                          height: 32.w,
                          width: 32.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: kMain)),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: kMain,
                            ),
                          )),
                    )
                  ],
                ))
              ],
            ),
            SizedBox(height: 16.w),
            SizedBox(
                width: Get.width,
                child: AppButtonPrimary(label: 'Add To Cart', onPressed: () {}))
          ],
        ),
      );
    });
  }
}
