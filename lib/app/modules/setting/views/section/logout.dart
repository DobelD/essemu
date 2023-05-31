import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../themes/colors/colors.dart';
import '../../../../themes/decoration/app_radius.dart';
import '../../../../themes/typograpy/typo.dart';
import '../../../../utils/assets/svg/svg_assets.dart';
import '../../controllers/setting_controller.dart';

class LogoutSection extends StatelessWidget {
  const LogoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingController());
    return SliverToBoxAdapter(
        child: Padding(
            padding: DefaultPadding.side,
            child: GestureDetector(
              onTap: () => controller.logout(),
              child: Container(
                decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: AppRadius.all,
                    border: Border.all(
                        color: kDividerItemSectionDashboard, width: 1.4)),
                padding: DefaultPadding.all,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      SgAssets.logout,
                      height: 20,
                      width: 20,
                      colorFilter: ColorFilter.mode(kBlack, BlendMode.srcIn),
                    ),
                    SizedBox(width: 12.w),
                    Text('Logout', style: AppTextTheme.current.bodyText),
                    Spacer(),
                    Icon(IconlyLight.arrow_right_2, color: kBlack)
                  ],
                ),
              ),
            )));
  }
}
