import 'package:essemu/app/components/textfield/text_field_label.dart';
import 'package:essemu/app/modules/profile/controllers/profile_controller.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FormSection extends StatelessWidget {
  const FormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: DefaultPadding.all,
      child: GetBuilder<ProfileController>(builder: (c) {
        return Column(
          children: [
            AppTextFieldLabel(
                controller: c.name,
                enabled: c.isSave ? false : true,
                hintText: 'Ali Imron',
                labelText: 'Nama Lengkap'),
            SizedBox(height: 12.h),
            AppTextFieldLabel(
                controller: c.email,
                enabled: c.isSave ? false : true,
                hintText: 'ali@gmail.com',
                labelText: 'Email'),
            SizedBox(height: 12.h),
            AppTextFieldLabel(
                controller: c.alamat,
                enabled: c.isSave ? false : true,
                hintText: 'Gumukmas',
                labelText: 'Alamat'),
            SizedBox(height: 12.h),
            AppTextFieldLabel(
                controller: c.tlp,
                enabled: c.isSave ? false : true,
                hintText: '08124131314',
                labelText: 'No Telephone'),
          ],
        );
      }),
    ));
  }
}
