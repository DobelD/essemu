import 'package:essemu/app/components/loading_action/loading_action.dart';
import 'package:essemu/app/routes/app_pages.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
          backgroundColor: kWhite,
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
                      onPressed: () => Get.toNamed(Routes.FORGOT),
                      child: Text(
                        'Forgot Password ?',
                        style: GoogleFonts.inter(
                            fontSize: 12,
                            color: kPrimary1,
                            fontWeight: FontWeight.w600),
                      )),
                ),
                SizedBox(height: 22.w),
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
            color: kWhite,
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
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(Routes.REGISTER),
                        text: " Sign Up",
                        style: GoogleFonts.inter(
                            fontSize: 12,
                            color: kPrimary1,
                            fontWeight: FontWeight.w600),
                      )
                    ],
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
