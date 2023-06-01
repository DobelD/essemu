import 'package:essemu/app/components/button/app_button.dart';
import 'package:essemu/app/modules/edit_profile/controllers/edit_profile_controller.dart';
import 'package:essemu/app/modules/edit_profile/widget/pick_images.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../themes/colors/colors.dart';

class AvatarSection extends StatelessWidget {
  const AvatarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GetBuilder<EditProfileController>(builder: (c) {
        return Padding(
          padding: DefaultPadding.all,
          child: Row(
            children: [
              Container(
                height: 90.w,
                width: 90.w,
                decoration: BoxDecoration(
                    color: kSoftMain,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage('${c.urlUsers}/${c.user.name}'))),
              ),
              SizedBox(width: 12.w),
              Column(
                children: [
                  Text(
                    'Update foto',
                    style: AppTextTheme.current.bodyText,
                  ),
                  SizedBox(height: 8.w),
                  AppButton.secondarySmall(
                      text: 'upload',
                      onPressed: () => Get.bottomSheet(PickerImages(),
                          enterBottomSheetDuration: 400.milliseconds,
                          exitBottomSheetDuration: 400.milliseconds))
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
