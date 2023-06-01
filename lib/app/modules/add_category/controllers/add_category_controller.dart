import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/snacbar/app_snackbar.dart';
import '../../../provider/endpoint.dart';

class AddCategoryController extends GetxController {
  TextEditingController nama = TextEditingController();
  Endpoint endpoint = Endpoint();
  bool isLoading = false;
  var imagesMenu;
  File? menu;
  Future getImageMenu() async {
    final sharedPref = await SharedPreferences.getInstance();
    final ImagePicker picker1 = ImagePicker();
    final imagePicked1 =
        await picker1.pickImage(source: ImageSource.camera, imageQuality: 30);

    imagesMenu = imagePicked1!.path;
    await sharedPref.setString('menu_url', imagesMenu);
    menu = File(imagePicked1.path);
    update();
  }

  Future getImageGalery() async {
    Get.back();
    final sharedPref = await SharedPreferences.getInstance();
    final ImagePicker picker1 = ImagePicker();
    final imagePicked1 =
        await picker1.pickImage(source: ImageSource.gallery, imageQuality: 30);

    imagesMenu = imagePicked1!.path;
    await sharedPref.setString('menu_url', imagesMenu);
    menu = File(imagePicked1.path);
    update();
  }

  addCategory() async {
    isLoading = true;
    update();
    if (nama.text.isNotEmpty && menu!.path.isNotEmpty) {
      await endpoint.addCategory(payload());
      await endpoint.addImageCategory('${nama.text}.jpg', menu!.path);
      nama.clear();
      menu == null;
      isLoading = false;
      update();
      Get.showSnackbar(appSnackBarSuccess('Berhasil menambahkan category'));
    } else {
      isLoading = false;
      update();
      print('Gagal');
    }
  }

  Map<String, dynamic> payload() {
    Map<String, dynamic> temp = <String, dynamic>{};
    temp['name'] = nama.text;
    temp['image_url'] = menu!.path;
    return temp;
  }
}
