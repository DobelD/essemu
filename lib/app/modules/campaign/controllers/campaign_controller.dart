import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/snacbar/app_snackbar.dart';
import '../../../provider/endpoint.dart';

class CampaignController extends GetxController {
  TextEditingController nama = TextEditingController();
  Endpoint endpoint = Endpoint();
  bool isLoading = false;
  var imagesCampaign;
  File? campaign;
  Future getImageCamera() async {
    final sharedPref = await SharedPreferences.getInstance();
    final ImagePicker picker1 = ImagePicker();
    final imagePicked1 =
        await picker1.pickImage(source: ImageSource.camera, imageQuality: 30);

    imagesCampaign = imagePicked1!.path;
    await sharedPref.setString('campaigns', imagesCampaign);
    campaign = File(imagePicked1.path);
    update();
  }

  Future getImageGalery() async {
    Get.back();
    final sharedPref = await SharedPreferences.getInstance();
    final ImagePicker picker1 = ImagePicker();
    final imagePicked1 =
        await picker1.pickImage(source: ImageSource.gallery, imageQuality: 30);

    imagesCampaign = imagePicked1!.path;
    await sharedPref.setString('campaigns', imagesCampaign);
    campaign = File(imagePicked1.path);
    update();
  }

  addCategory() async {
    isLoading = true;
    update();
    if (nama.text.isNotEmpty && campaign!.path.isNotEmpty) {
      await endpoint.addCampaign(payload());
      await endpoint.addImageCampaign('${nama.text}', campaign!.path);
      nama.clear();
      campaign == null;
      isLoading = false;
      update();
      Get.showSnackbar(appSnackBarSuccess('Success add campaign'));
    } else {
      isLoading = false;
      update();
      print('Gagal');
    }
  }

  Map<String, dynamic> payload() {
    Map<String, dynamic> temp = <String, dynamic>{};
    temp['name'] = nama.text;
    temp['url'] = campaign!.path;
    return temp;
  }
}
