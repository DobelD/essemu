import 'package:dotted_line/dotted_line.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/decoration/app_radius.dart';
import 'package:essemu/app/utils/assets/svg/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../themes/typograpy/typo.dart';

class StatusSection extends StatelessWidget {
  const StatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    String status = "proses";
    return SliverPadding(
      padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 0),
      sliver: SliverToBoxAdapter(
          child: Container(
              padding: DefaultPadding.all,
              decoration:
                  BoxDecoration(color: kWhite, borderRadius: AppRadius.all),
              child: Column(
                children: [
                  Text('Estimated delivery time is 16:18 PM',
                      style: AppTextTheme.current.bodyText),
                  SizedBox(height: 16.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 24.w,
                          width: 32.w,
                          child: SvgPicture.asset(
                            SgAssets.receipt,
                            colorFilter:
                                ColorFilter.mode(kWarning1, BlendMode.srcIn),
                          )),
                      SizedBox(width: 6.w),
                      DottedLine(
                        direction: Axis.horizontal,
                        lineLength: 30,
                        lineThickness: 1.0,
                        dashColor: status == "proses" ||
                                status == "antar" ||
                                status == "selesai"
                            ? kSuccess1
                            : kGrey2,
                      ),
                      SizedBox(width: 6.w),
                      SizedBox(
                          height: 24.w,
                          width: 32.w,
                          child: SvgPicture.asset(
                            SgAssets.cooking,
                            colorFilter:
                                ColorFilter.mode(kWarning1, BlendMode.srcIn),
                          )),
                      SizedBox(width: 6.w),
                      DottedLine(
                        direction: Axis.horizontal,
                        lineLength: 30,
                        lineThickness: 1.0,
                        dashColor: status == "antar" ||
                                status == "antar" ||
                                status == "selesai"
                            ? kSuccess1
                            : kGrey2,
                      ),
                      SizedBox(width: 6.w),
                      SizedBox(
                          height: 24.w,
                          width: 32.w,
                          child: SvgPicture.asset(
                            SgAssets.motorbike,
                            colorFilter:
                                ColorFilter.mode(kWarning1, BlendMode.srcIn),
                          )),
                      SizedBox(width: 6.w),
                      DottedLine(
                        direction: Axis.horizontal,
                        lineLength: 30,
                        lineThickness: 1.0,
                        dashColor: status == "selesai" ||
                                status == "antar" ||
                                status == "selesai"
                            ? kSuccess1
                            : kGrey2,
                      ),
                      SizedBox(width: 6.w),
                      SizedBox(
                          height: 24.w,
                          width: 32.w,
                          child: SvgPicture.asset(
                            SgAssets.tick,
                            colorFilter:
                                ColorFilter.mode(kWarning1, BlendMode.srcIn),
                          )),
                    ],
                  ),
                ],
              ))),
    );
  }
}
