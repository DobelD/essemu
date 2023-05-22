import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewMenu extends StatelessWidget {
  const AddNewMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: DefaultPadding.side,
        sliver: SliverToBoxAdapter(
          child: GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(bottom: 32.w),
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Row(
                  children: [
                    Icon(Icons.add, color: kSecondary1, size: 14),
                    SizedBox(width: 4.w),
                    Text(
                      'Add more items',
                      style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          color: kSecondary1,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
