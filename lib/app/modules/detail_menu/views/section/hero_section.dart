import 'package:essemu/app/data/categories.dart';
import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, this.data});
  final Menu? data;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomeController());
    return SliverToBoxAdapter(
        child: Hero(
      tag: 1,
      child: Container(
        height: 300.w,
        width: Get.width,
        decoration: BoxDecoration(
            color: kBlack,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(6.w),
                bottomRight: Radius.circular(6.w)),
            image: DecorationImage(
                image: NetworkImage('${c.publicUrlImages}/${data?.name}.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    kBlack.withOpacity(0.5), BlendMode.multiply))),
      ),
    ));
  }
}
