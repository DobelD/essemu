import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../components/button/app_button_primary.dart';
import '../../../components/loading_action/loading_action.dart';
import '../../../components/textfield/form.dart';
import '../../../themes/colors/colors.dart';
import '../../../themes/decoration/app_padding.dart';
import '../../../themes/typograpy/typo.dart';
import '../controllers/chenge_password_controller.dart';

class ChengePasswordView extends GetView<ChengePasswordController> {
  const ChengePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChengePasswordController>(builder: (c) {
      return AppLoading(
        isLoading: c.isLoading,
        child: Scaffold(
            backgroundColor: kMainBackground,
            appBar: AppBar(
              title: Text(
                'Change Password',
                style: AppTextTheme.current.appBarTitleDark,
              ),
              centerTitle: true,
              backgroundColor: kWhite,
            ),
            body: ListView(
              padding: DefaultPadding.all,
              children: [
                FormTxt.password(
                  controller: controller.passC,
                  title: 'Password',
                  hint: 'password',
                ),
                SizedBox(height: 22.w),
                FormTxt.password(
                  controller: controller.comfrPassc,
                  title: 'Konfirmasi Password',
                  hint: 'konfirmasi password',
                ),
                SizedBox(height: 22.w),
                AppButtonPrimary(
                  label: 'Change',
                  onPressed: () => controller.forgot(),
                )
              ],
            )),
      );
    });
  }
}
