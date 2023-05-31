import 'package:essemu/app/components/button/app_button_primary.dart';
import 'package:essemu/app/components/textfield/form.dart';
import 'package:essemu/app/modules/update_fee/controllers/update_fee_controller.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddCourier extends StatelessWidget {
  const AddCourier({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateFeeController());
    final bool isKeyboardVisible =
        KeyboardVisibilityProvider.isKeyboardVisible(context);
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: DefaultPadding.all,
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              FormTxt(
                controller: controller.name,
                title: 'Name',
                hint: 'name',
              ),
              SizedBox(height: 12.w),
              FormTxt(
                controller: controller.phone,
                title: 'No Telephone',
                hint: 'telephone',
              ),
              SizedBox(height: 16.w),
              SizedBox(
                width: Get.width,
                child: AppButtonPrimary(
                  label: 'Add Courier',
                  onPressed: () => controller.addCourier(),
                ),
              ),
              SizedBox(height: isKeyboardVisible ? 400.w : 0)
            ],
          ),
        ),
      ),
    );
  }
}
