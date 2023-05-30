import 'package:essemu/app/modules/menu_bycategory/controllers/menu_bycategory_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key, required this.name, required this.url});
  final String name;
  final String url;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MenuBycategoryController());
    return SliverAppBar(
      backgroundColor: kWhite,
      surfaceTintColor: kWhite,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.network(
            '${controller.pubicUrlCategory}${url}',
            height: 20.w,
            width: 20.w,
          ),
          SizedBox(width: 8.w),
          Text(
            '${name}',
            style: AppTextTheme.current.appBarTitleDark,
          ),
        ],
      ),
    );
  }
}
