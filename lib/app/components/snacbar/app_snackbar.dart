import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackbars extends GetSnackBar {
  const AppSnackbars({super.key, this.massage, this.color = kSoftMain});
  const AppSnackbars.success({super.key, this.massage, this.color = kSoftGrey});
  const AppSnackbars.failed(
      {super.key, this.massage, this.color = kSofterBlack});
  const AppSnackbars.error({super.key, this.massage, this.color = kSoftRed});

  final String? massage;
  final Color color;

  Widget build(BuildContext context) {
    return GetSnackBar(
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(16),
        backgroundColor: kSoftMain.withOpacity(0.8),
        borderRadius: 8,
        mainButton: Icon(
          Icons.close,
          color: kWhite,
          size: 20,
        ),
        messageText: Text(massage!, style: AppTextTheme.current.title6));
  }
}

GetSnackBar appSnackBarSuccess(String massage) {
  return GetSnackBar(
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 2),
      margin: EdgeInsets.all(16),
      backgroundColor: kSoftMain.withOpacity(0.8),
      borderRadius: 8,
      mainButton: Icon(
        Icons.close,
        color: kWhite,
        size: 20,
      ),
      messageText: Text(massage, style: AppTextTheme.current.title6));
}
