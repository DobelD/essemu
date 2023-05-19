import 'package:dotted_line/dotted_line.dart';
import 'package:essemu/app/components/button/app_button_primary.dart';
import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:essemu/app/routes/app_pages.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../components/dialog/app_dialog.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrlHome = Get.put(HomeController());
    return Container(
        height: 200.w,
        width: Get.width,
        color: kWhite,
        padding: DefaultPadding.all,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sub Total',
                  style: GoogleFonts.inter(
                      fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Rp. 20000',
                  style: GoogleFonts.inter(
                      color: kSoftGrey,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 12.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery Fee',
                  style: GoogleFonts.inter(
                      fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Rp. 20000',
                  style: GoogleFonts.inter(
                      color: kSoftGrey,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 14.w),
            DottedLine(
              direction: Axis.horizontal,
              lineLength: double.infinity,
              lineThickness: 1.0,
              dashColor: kGrey2,
            ),
            SizedBox(height: 14.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: GoogleFonts.inter(
                      fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Rp. 20000',
                  style: GoogleFonts.inter(
                      fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 24.w),
            SizedBox(
                width: Get.width,
                child: AppButtonPrimary(
                  label: 'Checkout',
                  onPressed: () => Get.dialog(AppDialog(
                    onPressed: () {
                      Get.back();
                      ctrlHome.onOrderCreate();
                      Get.toNamed(Routes.MAIN_PAGES);
                    },
                  )),
                ))
          ],
        ));
  }
}
