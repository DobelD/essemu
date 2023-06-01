import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';
import 'section/appbar_section.dart';
import 'section/avatar.dart';
import 'section/footer_section.dart';
import 'section/form_section.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackground,
      body: CustomScrollView(
        slivers: [AppBarSection(), AvatarSection(), FormSection()],
      ),
      bottomSheet: FooterSection(),
    );
  }
}
