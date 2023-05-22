import 'package:essemu/app/data/categories.dart';
import 'package:essemu/app/modules/detail_menu/controllers/detail_menu_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BodySection extends StatelessWidget {
  const BodySection({super.key, this.data, required this.fav});
  final Menu? data;
  final bool fav;

  @override
  Widget build(BuildContext context) {
    // final ctrlHome = Get.put(HomeController());
    return SliverPadding(
        padding: DefaultPadding.all,
        sliver: SliverToBoxAdapter(
            child: GetBuilder<DetailMenuController>(builder: (c) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Detail',
                    style: GoogleFonts.inter(
                        fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Icon(
                    Icons.timer_outlined,
                    color: kBlack,
                    size: 16,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    '15 min',
                    style: GoogleFonts.inter(
                        fontSize: 14.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: 12.w),
              SizedBox(
                width: Get.width * 0.9,
                child: Text(
                  '${data?.description}',
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: kGrey1),
                ),
              ),
            ],
          );
        })));
  }
}
