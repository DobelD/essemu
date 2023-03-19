import 'package:essemu/app/components/loading_action/loading_action.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../components/button/app_button_primary.dart';
import '../../../components/textfield/text_field_label.dart';
import '../../../themes/typograpy/typo.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return GetBuilder<AuthController>(builder: (context) {
      return AppLoading(
        isLoading: controller.isLoading,
        child: Scaffold(
          backgroundColor: kMainBackground,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: ListView(
              padding: EdgeInsets.all(16.w),
              children: [
                Container(
                  height: 350.h,
                  width: Get.width * 0.9,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/login.png'),
                          fit: BoxFit.contain)),
                ),
                AppTextFieldLabel.textUser(
                  controller: controller.emailC,
                  fillColors: kMain.withOpacity(0.05),
                  borderColors: false,
                  hintText: 'Email',
                ),
                AppTextFieldLabel.textPassword(
                  controller: controller.passC,
                  fillColors: kMain.withOpacity(0.05),
                  borderColors: false,
                  hintText: 'Password',
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password ?',
                        style: AppTextTheme.current.title5,
                      )),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16.w),
                  height: 78.h,
                  width: Get.width,
                  child: AppButtonPrimary(
                      label: 'Login', onPressed: () => controller.signIn()),
                ),
              ],
            ),
          ),
          bottomSheet: Container(
            height: 86.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            color: kMainBackground,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Divider(
                  color: kDividerItemSectionDashboard,
                  thickness: 1.2,
                  height: 0,
                ),
                SizedBox(height: 18.h),
                RichText(
                    text: TextSpan(
                        children: [
                      TextSpan(
                          text: " Sign Up", style: AppTextTheme.current.title5)
                    ],
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        text: "Don't have account?",
                        style: AppTextTheme.current.title6)),
              ],
            ),
          ),
        ),
      );
    });
  }
}
