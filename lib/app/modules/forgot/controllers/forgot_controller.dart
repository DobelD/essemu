import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../themes/colors/colors.dart';
import '../../../themes/decoration/app_padding.dart';
import '../../../themes/typograpy/typo.dart';
import '../services/user_servvice.dart';

class ForgotController extends GetxController {
  late TextEditingController email;
  bool isLoading = false;
  SupabaseClient client = Supabase.instance.client;

  void forgot() async {
    isLoading = true;
    update();
    if (email.text.isEmpty) {
      isLoading = false;
      update();
      Get.showSnackbar(GetSnackBar(
        borderRadius: 8.r,
        backgroundColor: kWarning1,
        duration: 2.seconds,
        margin: DefaultPadding.all,
        snackPosition: SnackPosition.TOP,
        messageText: Text('Email harus diisi',
            style: AppTextTheme.current.bodyTextWhite),
      ));
    }
    final user = await UserService().getUser(email.text);
    if (user == true) {
      await client.auth.resetPasswordForEmail(email.text,
          redirectTo: 'https://essemu-dobeld.vercel.app/reset');
      // await client.auth.updateUser(UserAttributes(password: '12345678'));
      isLoading = false;
      update();
      email.clear();
      Get.showSnackbar(GetSnackBar(
        borderRadius: 8.r,
        backgroundColor: kSuccess1,
        duration: 2.seconds,
        margin: DefaultPadding.all,
        snackPosition: SnackPosition.TOP,
        messageText: Text('Reset password berhasil',
            style: AppTextTheme.current.bodyTextWhite),
      ));
    } else {
      isLoading = false;
      update();
      Get.showSnackbar(GetSnackBar(
        borderRadius: 8.r,
        backgroundColor: kWarning1,
        duration: 2.seconds,
        margin: DefaultPadding.all,
        snackPosition: SnackPosition.TOP,
        messageText: Text('Reset password gagal',
            style: AppTextTheme.current.bodyTextWhite),
      ));
    }
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController(text: Get.arguments ?? '');
    super.onInit();
  }
}
