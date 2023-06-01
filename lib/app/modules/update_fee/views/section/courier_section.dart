import 'package:essemu/app/modules/update_fee/controllers/update_fee_controller.dart';
import 'package:essemu/app/modules/update_fee/views/widget/add_courier.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/decoration/app_radius.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../../../../components/bottom_sheet/bottom_sheet.dart';

class CourierSection extends StatelessWidget {
  const CourierSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateFeeController());
    return SliverToBoxAdapter(
        child: Padding(
            padding: DefaultPadding.side,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('List Courier', style: AppTextTheme.current.bodyText),
                    TextButton(
                        onPressed: () {
                          showSlidingBottomSheet(
                            context,
                            builder: (BuildContext context) {
                              return SlidingSheetDialog(
                                elevation: 8,
                                cornerRadius: 8.r,
                                snapSpec: const SnapSpec(
                                  snap: true,
                                  snappings: [1.0],
                                  positioning:
                                      SnapPositioning.relativeToAvailableSpace,
                                ),
                                builder: (context, state) {
                                  return KeyboardVisibilityProvider(
                                    child: BSheet(
                                        isLabel: true,
                                        label: 'Add Courir',
                                        child: AddCourier()),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: kBlack,
                              size: 14,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              'Add Courier',
                              style: AppTextTheme.current.link,
                            ),
                          ],
                        )),
                  ],
                ),
                SizedBox(height: 12.w),
                GetBuilder<UpdateFeeController>(builder: (c) {
                  return Column(
                      children: List.generate(
                          controller.courier.length,
                          (index) => controller.courier[index].id != 0
                              ? Padding(
                                  padding: EdgeInsets.only(bottom: 12.w),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: kWhite,
                                        borderRadius: AppRadius.all),
                                    child: ListTile(
                                      leading: Text(
                                        '#${index + 1}',
                                        style: AppTextTheme.current.link,
                                      ),
                                      title: Text(
                                        '${controller.courier[index].name}',
                                        style: AppTextTheme.current.bodyText,
                                      ),
                                      subtitle: Text(
                                        '${controller.courier[index].phone}',
                                        style: AppTextTheme.current.hintText,
                                      ),
                                      trailing: SizedBox(
                                        width: 60,
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                                onTap: () {},
                                                child: Icon(
                                                  IconlyLight.edit,
                                                  color: kBlack,
                                                  size: 20,
                                                )),
                                            SizedBox(width: 16.w),
                                            GestureDetector(
                                                onTap: () => controller
                                                    .deleteCourier(controller
                                                        .courier[index].id!),
                                                child: Icon(
                                                  IconlyLight.delete,
                                                  color: kBlack,
                                                  size: 20,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox()));
                })
              ],
            )));
  }
}
