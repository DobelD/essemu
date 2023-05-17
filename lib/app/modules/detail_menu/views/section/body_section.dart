import 'package:essemu/app/data/categories.dart';
import 'package:essemu/app/modules/detail_menu/controllers/detail_menu_controller.dart';
import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../../../../provider/endpoint.dart';

class BodySection extends StatelessWidget {
  const BodySection({super.key, this.data, required this.fav});
  final Menu? data;
  final bool fav;

  @override
  Widget build(BuildContext context) {
    final ctrlHome = Get.put(HomeController());
    return SliverPadding(
        padding: DefaultPadding.all,
        sliver: SliverToBoxAdapter(
            child: GetBuilder<DetailMenuController>(builder: (c) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * 0.7,
                    child: Text(
                      '${data?.name}',
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      style: GoogleFonts.inter(
                          fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      print(ctrlHome.idUser);
                      Endpoint endpoint = Endpoint();
                      fav
                          ? await endpoint.deleteFavorite(
                              data?.id ?? 0, ctrlHome.idUser)
                          : c.addFavorite(ctrlHome.idUser, data?.id ?? 0);
                      c.getFavorite(ctrlHome.idUser);
                    },
                    child: Container(
                      height: 42.w,
                      width: 42.w,
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: kWhite),
                      child: Center(
                          child: Icon(
                              fav ? IconlyBold.heart : IconlyLight.heart,
                              color: fav ? kRed : kSoftGrey)),
                    ),
                  )
                ],
              ),
              Text(
                '${ctrlHome.roundedDistance} Km from you',
                style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: kGrey1),
              ),
              SizedBox(height: 22.w),
              Text(
                'Detail',
                style: GoogleFonts.inter(
                    fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 6.w),
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
