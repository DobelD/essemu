import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:essemu/app/utils/assets/svg/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/colors/colors.dart';
import '../../../../themes/typograpy/typo.dart';
import '../widget/shimmer/heading.dart';

class HeadingSection extends StatelessWidget {
  const HeadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    // CartService service = CartService();
    final controller = Get.put(HomeController());
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kWhite,
      surfaceTintColor: kWhite,
      pinned: true,
      title: GetBuilder<HomeController>(builder: (c) {
        return c.loading
            ? HeadingLoading()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Text(
                                'Hello ${c.user.name ?? ''}',
                                style: AppTextTheme.current.title2,
                              ),
                              SizedBox(
                                  height: 24.w,
                                  width: 24.w,
                                  child: Lottie.network(
                                      'https://assets8.lottiefiles.com/packages/lf20_6niurjte.json'))
                            ],
                          ),
                        ),
                        Text(
                          "it's launch time",
                          style: AppTextTheme.current.highlightsBody,
                        ),
                      ],
                    ),
                  ),
                ],
              );
      }),
      actions: [
        IconButton(
            onPressed: () => Get.toNamed(Routes.CARTS,arguments: controller.user),
            icon: SvgPicture.asset(
              SgAssets.shoppingCart,
              height: 22.w,
              width: 22.w,
            ))
      ],
    );
  }
}
