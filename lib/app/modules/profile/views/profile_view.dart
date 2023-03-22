import 'package:essemu/app/components/loading_action/loading_action.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../components/spacer/sliver_spacer.dart';
import '../controllers/profile_controller.dart';
import 'section/appbar.dart';
import 'section/header.dart';
import 'section/logout.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return GetBuilder<ProfileController>(builder: (c) {
      return AppLoading(
        isLoading: controller.isLoading,
        child: Scaffold(
            backgroundColor: kMainBackground,
            body: CustomScrollView(
              slivers: [
                AppBars(),
                SliverSpacerV(hight: 16),
                HeaderSection(),
                LogoutSection()
              ],
            )),
      );
    });
  }
}
