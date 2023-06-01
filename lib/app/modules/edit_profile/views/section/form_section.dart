import 'package:essemu/app/components/textfield/desk_form.dart';
import 'package:essemu/app/modules/edit_profile/controllers/edit_profile_controller.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/textfield/form.dart';

class FormSection extends StatelessWidget {
  const FormSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfileController());
    return SliverPadding(
      padding: DefaultPadding.all,
      sliver: SliverToBoxAdapter(
          child: Column(
        children: [
          FormTxt(
            controller: controller.name,
            title: 'Name',
            hint: 'Name',
          ),
          SizedBox(height: 8.w),
          FormTxt(
            controller: controller.email,
            title: 'Email',
            hint: 'Email',
          ),
          SizedBox(height: 8.w),
          FormTxt(
            controller: controller.phone,
            title: 'Telephone',
            hint: 'Telephone',
          ),
          SizedBox(height: 8.w),
          DeskForm(
            controller: controller.address,
            title: 'Address',
            hint: 'Address',
          ),
          SizedBox(height: 8.w),
        ],
      )),
    );
  }
}
