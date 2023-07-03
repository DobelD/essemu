import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../themes/colors/colors.dart';
import '../../../themes/decoration/app_padding.dart';
import '../../../themes/typograpy/typo.dart';

class ChengePasswordController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController comfrPassc = TextEditingController();

  bool isLoading = false;
  SupabaseClient client = Supabase.instance.client;

  void forgot() async {
    isLoading = true;
    update();
    if (passC.text.isEmpty || comfrPassc.text.isEmpty) {
      isLoading = false;
      update();
      Get.showSnackbar(GetSnackBar(
        borderRadius: 8.r,
        backgroundColor: kWarning1,
        duration: 2.seconds,
        margin: DefaultPadding.all,
        snackPosition: SnackPosition.TOP,
        messageText: Text('Password harus diisi',
            style: AppTextTheme.current.bodyTextWhite),
      ));
    }

    if (passC.text == comfrPassc.text) {
      final response =
          await client.auth.updateUser(UserAttributes(password: passC.text));
      isLoading = false;
      update();
      email.clear();
      Get.showSnackbar(GetSnackBar(
        borderRadius: 8.r,
        backgroundColor: kSuccess1,
        duration: 2.seconds,
        margin: DefaultPadding.all,
        snackPosition: SnackPosition.TOP,
        messageText: Text('Ganti password berhasil',
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
        messageText: Text('Ganti password gagal',
            style: AppTextTheme.current.bodyTextWhite),
      ));
    }
    isLoading = false;
    update();
  }
}
