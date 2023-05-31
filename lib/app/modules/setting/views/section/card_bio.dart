import 'package:essemu/app/routes/app_pages.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:essemu/app/utils/assets/svg/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../themes/decoration/app_radius.dart';
import '../../controllers/setting_controller.dart';

class CardBioSection extends StatelessWidget {
  const CardBioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: DefaultPadding.side,
        sliver: SliverToBoxAdapter(
            child: GetBuilder<SettingController>(builder: (c) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: AppRadius.all,
                    border: Border.all(
                        color: kDividerItemSectionDashboard, width: 1.4)),
                padding: DefaultPadding.all,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Email', style: AppTextTheme.current.bodyText),
                        Expanded(
                            child: Text(
                          '${c.rest.email}',
                          textAlign: TextAlign.right,
                          style: AppTextTheme.current.hintText,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
                      ],
                    ),
                    Padding(
                      padding: DefaultPadding.updown,
                      child: Divider(
                        height: 0,
                        color: kDividerItemSectionDashboard,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('No Hp', style: AppTextTheme.current.bodyText),
                        Expanded(
                            child: Text(
                          '${c.rest.phone}',
                          textAlign: TextAlign.right,
                          style: AppTextTheme.current.hintText,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
                      ],
                    ),
                    Padding(
                      padding: DefaultPadding.updown,
                      child: Divider(
                        height: 0,
                        color: kDividerItemSectionDashboard,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Open', style: AppTextTheme.current.bodyText),
                        Expanded(
                            child: Text(
                          '${c.rest.open} PM',
                          textAlign: TextAlign.right,
                          style: AppTextTheme.current.hintText,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
                      ],
                    ),
                    Padding(
                      padding: DefaultPadding.updown,
                      child: Divider(
                        height: 0,
                        color: kDividerItemSectionDashboard,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Close', style: AppTextTheme.current.bodyText),
                        Expanded(
                            child: Text(
                          '${c.rest.closed} AM',
                          textAlign: TextAlign.right,
                          style: AppTextTheme.current.hintText,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.w),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.EDIT_PROFILE),
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
                        SgAssets.compose,
                        height: 20,
                        width: 20,
                        colorFilter: ColorFilter.mode(kBlack, BlendMode.srcIn),
                      ),
                      SizedBox(width: 12.w),
                      Text('Edit Profile',
                          style: AppTextTheme.current.bodyText),
                      Spacer(),
                      Icon(IconlyLight.arrow_right_2, color: kBlack)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.w),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.UPDATE_FEE,
                    arguments: {'id': c.rest.id, 'fee': c.rest.deliveryFee}),
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
                        SgAssets.fee,
                        height: 20,
                        width: 20,
                        colorFilter: ColorFilter.mode(kBlack, BlendMode.srcIn),
                      ),
                      SizedBox(width: 12.w),
                      Text('Delivery', style: AppTextTheme.current.bodyText),
                      Spacer(),
                      Icon(IconlyLight.arrow_right_2, color: kBlack)
                    ],
                  ),
                ),
              )
            ],
          );
        })));
  }
}
