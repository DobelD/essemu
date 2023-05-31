import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../themes/colors/colors.dart';
import '../../../../themes/decoration/app_padding.dart';
import '../../../../themes/decoration/app_radius.dart';
import '../../../../themes/typograpy/typo.dart';
import '../../../../utils/assets/svg/svg_assets.dart';
import '../../controllers/setting_controller.dart';
import '../widget/about_app.dart';

class MoreCardSection extends StatelessWidget {
  const MoreCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: DefaultPadding.side,
      sliver:
          SliverToBoxAdapter(child: GetBuilder<SettingController>(builder: (c) {
        return Container(
          decoration: BoxDecoration(
              color: kWhite,
              borderRadius: AppRadius.all,
              border:
                  Border.all(color: kDividerItemSectionDashboard, width: 1.4)),
          padding: DefaultPadding.all,
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Get.dialog(AboutApp()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      SgAssets.information,
                      height: 20,
                      width: 20,
                      colorFilter: ColorFilter.mode(kBlack, BlendMode.srcIn),
                    ),
                    SizedBox(width: 12.w),
                    Text('About', style: AppTextTheme.current.bodyText),
                    Spacer(),
                    Icon(IconlyLight.arrow_right_2, color: kBlack)
                  ],
                ),
              ),
            ],
          ),
        );
      })),
    );
  }
}
