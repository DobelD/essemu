import 'dart:io';

import 'package:essemu/app/data/user.dart';
import 'package:essemu/app/modules/edit_profile/services/profile_service.dart';
import 'package:essemu/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../themes/colors/colors.dart';
import '../../../themes/decoration/app_padding.dart';
import '../../../themes/typograpy/typo.dart';

class EditProfileController extends GetxController {
  final ctrl = Get.put(ProfileController());
  String urlUsers =
      'https://yccxlnodtgrnbcfdjqcg.supabase.co/storage/v1/object/public/users/';
  User user = User();
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController address;

  var imagesUser;
  File? userFile;
  Future getImageMenu() async {
    final sharedPref = await SharedPreferences.getInstance();
    final ImagePicker picker1 = ImagePicker();
    final imagePicked1 =
        await picker1.pickImage(source: ImageSource.gallery, imageQuality: 30);

    imagesUser = imagePicked1!.path;
    await sharedPref.setString('user_url', imagesUser);
    userFile = File(imagePicked1.path);
    update();
  }

  Future getImageGalery() async {
    final sharedPref = await SharedPreferences.getInstance();
    final ImagePicker picker1 = ImagePicker();
    final imagePicked1 =
        await picker1.pickImage(source: ImageSource.gallery, imageQuality: 30);

    imagesUser = imagePicked1!.path;
    await sharedPref.setString('user_url', imagesUser);
    userFile = File(imagePicked1.path);
    update();
  }

  void updates() async {
    final service = EditProfileService();
    final profile = await service.updates(
        user.id!, name.text, email.text, 'gender', phone.text, address.text);
    if (profile) {
      ctrl.getUser();
      Get.showSnackbar(GetSnackBar(
        borderRadius: 8.r,
        backgroundColor: kSuccess1,
        duration: 2.seconds,
        margin: DefaultPadding.all,
        snackPosition: SnackPosition.TOP,
        messageText: Text('Success update profile',
            style: AppTextTheme.current.bodyTextWhite),
      ));
    } else {
      Get.showSnackbar(GetSnackBar(
        borderRadius: 8.r,
        backgroundColor: kWarning1,
        duration: 2.seconds,
        margin: DefaultPadding.all,
        snackPosition: SnackPosition.TOP,
        messageText: Text('Error update profile',
            style: AppTextTheme.current.bodyTextWhite),
      ));
    }
  }

  @override
  void onInit() {
    user = Get.arguments;
    name = TextEditingController(text: user.name);
    email = TextEditingController(text: user.email);
    phone = TextEditingController(text: user.phone);
    address = TextEditingController(text: user.address);
    super.onInit();
  }
}
