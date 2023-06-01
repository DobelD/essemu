import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/button/app_button_primary.dart';
import '../../../components/loading_action/loading_action.dart';
import '../../../components/textfield/form.dart';
import '../../../routes/app_pages.dart';
import '../../../themes/colors/colors.dart';
import '../../../themes/typograpy/typo.dart';
import '../controllers/register_controller.dart';
import '../widget/dropdown.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (context) {
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
                  height: 250.h,
                  width: Get.width * 0.9,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/login.png'),
                          fit: BoxFit.contain)),
                ),
                FormTxt(
                  controller: controller.name,
                  title: 'Nama',
                  hint: 'nama',
                ),
                SizedBox(height: 8.w),
                FormTxt(
                  controller: controller.email,
                  title: 'Email',
                  hint: 'email',
                ),
                SizedBox(height: 8.w),
                FormTxt(
                  controller: controller.phone,
                  title: 'No Telephone',
                  hint: 'no telephone',
                ),
                SizedBox(height: 8.w),
                DropGender(),
                SizedBox(height: 8.w),
                FormTxt(
                  controller: controller.address,
                  title: 'Alamat',
                  hint: 'alamat',
                ),
                SizedBox(height: 8.w),
                FormTxt.password(
                  controller: controller.password,
                  title: 'Password',
                  hint: 'password',
                ),
                SizedBox(height: 8.w),
                FormTxt.password(
                  controller: controller.passwordConfirmation,
                  title: 'Konfirmasi Password',
                  hint: 'password',
                ),
                SizedBox(height: 12.w),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16.w),
                  height: 78.h,
                  width: Get.width,
                  child: AppButtonPrimary(
                      label: 'Register',
                      onPressed: () => controller.registers()),
                ),
                SizedBox(height: 190.w)
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
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(Routes.AUTH),
                        text: " Sign In",
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
