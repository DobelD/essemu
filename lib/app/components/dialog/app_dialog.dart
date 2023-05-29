import 'package:essemu/app/components/button/app_button_primary.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_radius.dart';
import 'package:essemu/app/utils/assets/json/json_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../themes/decoration/app_padding.dart';
import '../../themes/typograpy/typo.dart';

class AppDialog extends StatelessWidget {
  const AppDialog(
      {super.key,
      this.title,
      this.massage,
      required this.onPressed,
      this.isSend = false,
      this.isCencel = false,
      this.isDone = false});

  final String? title;
  final String? massage;
  final VoidCallback onPressed;
  final bool isSend;
  final bool isCencel;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.symmetric(vertical: 200.w, horizontal: 16.w),
        child: Container(
            decoration:
                BoxDecoration(color: kWhite, borderRadius: AppRadius.all),
            child: Material(
              color: Colors.transparent,
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(20.w),
                      height: 250.w,
                      width: Get.width,
                      child: Lottie.asset(isSend
                          ? LtAssets.deliveryBike
                          : isCencel
                              ? LtAssets.cencel
                              : isDone
                                  ? LtAssets.done
                                  : LtAssets.food)),
                  Padding(
                    padding: DefaultPadding.all,
                    child: Column(
                      children: [
                        SizedBox(
                          width: Get.width * 0.9,
                          child: Text(
                            isSend
                                ? 'Apakah pesanan sudah siap dikirim ?'
                                : isCencel
                                    ? 'Apakah anda menolak pesanan'
                                    : isDone
                                        ? 'Apakah pesanan sudah selesai diantar ?'
                                        : 'Lanjutkan pemesanan ?',
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextTheme.current.hintText,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                  height: 34.h,
                                  width: 100.w,
                                  child: AppButtonPrimary(
                                      label: 'Kembali',
                                      onPressed: () => Get.back())),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: SizedBox(
                                  height: 34.h,
                                  width: 100.w,
                                  child: AppButtonPrimary(
                                      label: isSend
                                          ? 'Kirim'
                                          : isCencel
                                              ? 'Tolak'
                                              : isDone
                                                  ? 'Ya'
                                                  : 'Lanjutkan',
                                      onPressed: onPressed)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
