import 'package:essemu/app/modules/register/services/regist_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../themes/colors/colors.dart';
import '../../../themes/decoration/app_padding.dart';
import '../../../themes/typograpy/typo.dart';

class RegisterController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirmation = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  String? selectedGender;
  List<Map<String, dynamic>> listGender = [
    {"name": "Male"},
    {"name": "Female"}
  ];

  updateGender(String value) {
    selectedGender = value;
    print(selectedGender);
    update();
  }

  bool isLoading = false;

  Future<void> registers() async {
    isLoading = true;
    update();
    if (email.text.isNotEmpty && password.text.isNotEmpty ||
        passwordConfirmation.text == password.text) {
      final service = RegistService();
      final regst = await service.regs(
          email.text,
          password.text,
          passwordConfirmation.text,
          name.text,
          address.text,
          '',
          phone.text,
          2,
          selectedGender!);
      if (regst) {
        isLoading = false;
        update();
        name.clear();
        email.clear();
        phone.clear();
        address.clear();
        password.clear();
        passwordConfirmation.clear();
        Get.showSnackbar(GetSnackBar(
          borderRadius: 8.r,
          backgroundColor: kSuccess1,
          duration: 2.seconds,
          margin: DefaultPadding.all,
          snackPosition: SnackPosition.TOP,
          messageText: Text(
              'Berhasil mendaftar, silahkan cek email untuk konfirmasi',
              style: AppTextTheme.current.bodyTextWhite),
        ));
      } else {
        isLoading = false;
        update();
        Get.showSnackbar(GetSnackBar(
          borderRadius: 8.r,
          backgroundColor: kRed,
          duration: 2.seconds,
          margin: DefaultPadding.all,
          snackPosition: SnackPosition.TOP,
          messageText: Text('Pendaftaran Gagal, terdapat kesalahan',
              style: AppTextTheme.current.bodyTextWhite),
        ));
      }
    } else {
      isLoading = false;
      update();
    }
    isLoading = false;
    update();
  }
}
