import 'package:essemu/app/components/button/app_button_primary.dart';
import 'package:essemu/app/components/loading_action/loading_action.dart';
import 'package:essemu/app/components/textfield/form.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/forgot_controller.dart';

class ForgotView extends GetView<ForgotController> {
  const ForgotView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotController>(builder: (c) {
      return AppLoading(
        isLoading: c.isLoading,
        child: Scaffold(
            backgroundColor: kMainBackground,
            appBar: AppBar(
              title: Text(
                'Forgot Password',
                style: AppTextTheme.current.appBarTitleDark,
              ),
              centerTitle: true,
              backgroundColor: kWhite,
            ),
            body: ListView(
              padding: DefaultPadding.all,
              children: [
                FormTxt(
                  controller: controller.email,
                  title: 'Email',
                  hint: 'email',
                ),
                SizedBox(height: 22.w),
                AppButtonPrimary(
                  label: 'Kirim',
                  onPressed: () => controller.forgot(),
                )
              ],
            )),
      );
    });
  }
}
