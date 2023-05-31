import 'dart:async';

import 'package:essemu/app/modules/setting/controllers/setting_controller.dart';
import 'package:essemu/app/modules/update_fee/services/courier_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../data/courier.dart';
import '../../../themes/colors/colors.dart';
import '../../../themes/decoration/app_padding.dart';
import '../../../themes/typograpy/typo.dart';

class UpdateFeeController extends GetxController {
  final ctrl = Get.put(SettingController());
  late TextEditingController fee;
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  bool isLoading = false;
  bool isKeyboardVisible = false;
  SupabaseClient client = Supabase.instance.client;
  int id = 0;
  List<Courier> _courier = [];
  List<Courier> get courier => _courier;

  setCourier(List<Courier> data) {
    _courier = data;
    update();
  }

  getCaourier() async {
    final service = CourierService();
    final data = await service.getData(id);
    setCourier(data);
  }

  void updates() async {
    isLoading = true;
    update();
    final response = await client.from('restaurant').update(
        {'delivery_fee': int.parse(fee.text)}).eq('id', Get.arguments['id']);
    Future.delayed(2.seconds, () {
      isLoading = false;
      update();
    });
    Get.showSnackbar(GetSnackBar(
      borderRadius: 8.r,
      backgroundColor: kSuccess1,
      duration: 2.seconds,
      margin: DefaultPadding.all,
      snackPosition: SnackPosition.TOP,
      messageText:
          Text('Update success', style: AppTextTheme.current.bodyTextWhite),
    ));
    ctrl.updateData();
  }

  addCourier() async {
    final service = CourierService();
    final add = await service.addCourier(id, name.text, int.parse(phone.text));
    print(add);
    if (add) {
      getCaourier();
      Get.back();
      Get.showSnackbar(GetSnackBar(
        borderRadius: 8.r,
        backgroundColor: kSuccess1,
        duration: 2.seconds,
        margin: DefaultPadding.all,
        snackPosition: SnackPosition.TOP,
        messageText:
            Text('Courier Added', style: AppTextTheme.current.bodyTextWhite),
      ));
    } else {
      Get.back();
      Get.showSnackbar(GetSnackBar(
        borderRadius: 8.r,
        backgroundColor: kWarning1,
        duration: 2.seconds,
        margin: DefaultPadding.all,
        snackPosition: SnackPosition.TOP,
        messageText: Text('Courier not Added',
            style: AppTextTheme.current.bodyTextWhite),
      ));
    }
  }

  void deleteCourier(int idCourier) async {
    final service = CourierService();
    final add = await service.delete(idCourier);
    if (add) {
      getCaourier();
      Get.showSnackbar(GetSnackBar(
        borderRadius: 8.r,
        backgroundColor: kSuccess1,
        duration: 2.seconds,
        margin: DefaultPadding.all,
        snackPosition: SnackPosition.TOP,
        messageText:
            Text('Courier deleted', style: AppTextTheme.current.bodyTextWhite),
      ));
    } else {
      Get.showSnackbar(GetSnackBar(
        borderRadius: 8.r,
        backgroundColor: kWarning1,
        duration: 2.seconds,
        margin: DefaultPadding.all,
        snackPosition: SnackPosition.TOP,
        messageText: Text('Courier not deleted',
            style: AppTextTheme.current.bodyTextWhite),
      ));
    }
  }

  @override
  void onInit() {
    fee = TextEditingController(text: '${Get.arguments['fee'] ?? 0}');
    id = Get.arguments['id'];
    getCaourier();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
