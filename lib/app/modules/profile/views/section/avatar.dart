import 'package:essemu/app/modules/profile/controllers/profile_controller.dart';
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
      child: GetBuilder<ProfileController>(builder: (c) {
        return Column(
          children: [
            Container(
              height: 90.w,
              width: 90.w,
              decoration:
                  BoxDecoration(color: kSoftMain, shape: BoxShape.circle),
            ),
            SizedBox(height: 12.w),
            Text(
              '${c.user.name}',
              style: AppTextTheme.current.title2,
            )
          ],
        );
      }),
    );
  }
}
