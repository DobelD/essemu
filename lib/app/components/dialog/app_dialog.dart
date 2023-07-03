import 'package:essemu/app/components/button/app_button_primary.dart';
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
      this.isDone = false,
      this.isOver = false});

  final String? title;
  final String? massage;
  final VoidCallback onPressed;
  final bool isSend;
  final bool isCencel;
  final bool isDone;
  final bool isOver;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: DefaultPadding.side,
        child: Container(
            padding: DefaultPadding.all,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.white,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 800.w, minHeight: 100.w),
              child: SingleChildScrollView(
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
                                      : isOver
                                          ? LtAssets.overRadius
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
                                            : isOver
                                                ? 'Jarak anda terlalu jauh dari batas radius yang ditentukan restoran (4 Km), apakah anda bersedia menambah biaya ongkos kirim sebesar Rp. 5.000 per 1 Km dari batas radius ?'
                                                : 'Lanjutkan pemesanan ?',
                                maxLines: 6,
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
                ),
              ),
            )));
  }
}
