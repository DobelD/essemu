import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCategoryController extends GetxController {
  TextEditingController nama = TextEditingController();
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

  addCategory() {}
}
