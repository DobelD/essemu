import 'package:essemu/app/modules/edit_delivery_address/controllers/edit_delivery_address_controller.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/textfield/desk_form.dart';
import '../../../../components/textfield/form.dart';

class FormSection extends StatelessWidget {
  const FormSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditDeliveryAddressController());
    return SliverToBoxAdapter(
      child: Padding(
        padding: DefaultPadding.all,
        child: Column(
          children: [
            FormTxt(
              controller: controller.nameC,
              title: 'Nama',
              hint: 'Nama',
            ),
            SizedBox(height: 12.h),
            FormTxt(
              controller: controller.phoneC,
              title: 'Telephone',
              hint: 'Phone number',
            ),
            SizedBox(height: 12.h),
            DeskForm(
              controller: controller.addressC,
              title: 'Address',
              hint: 'Address',
            ),
          ],
        ),
      ),
    );
  }
}
