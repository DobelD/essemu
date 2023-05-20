import 'package:essemu/app/data/categories.dart';
import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/decoration/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, this.data});
  final Menu? data;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomeController());
    return SliverToBoxAdapter(
        child: Hero(
      tag: 1,
      child: Padding(
        padding: DefaultPadding.all,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Get.width * 0.8,
              child: Text(
                '${data?.name}',
                maxLines: 2,
                overflow: TextOverflow.clip,
                style: GoogleFonts.inter(
                    fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 12.w),
            Row(children: [
              Container(
                height: 26.w,
                width: 26.w,
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kSecondary4,
                    image: DecorationImage(image: NetworkImage(''))),
              ),
              SizedBox(width: 12.w),
              Text(
                '${data?.categories?.name}',
                maxLines: 2,
                overflow: TextOverflow.clip,
                style: GoogleFonts.inter(
                    fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Text(
                '${c.roundedDistance} Km from you',
                style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: kGrey1),
              ),
            ]),
            SizedBox(height: 16.w),
            Container(
              height: 300.w,
              width: Get.width,
              decoration: BoxDecoration(
                  color: kBlack,
                  borderRadius: AppRadius.all,
                  image: DecorationImage(
                      image: NetworkImage(
                          '${c.publicUrlImages}/${data?.name}.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          kBlack.withOpacity(0.5), BlendMode.multiply))),
            ),
          ],
        ),
      ),
    ));
  }
}
