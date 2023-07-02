import 'package:essemu/app/components/loading_action/loading_action.dart';
import 'package:essemu/app/modules/profile/views/section/card_bio.dart';
import 'package:essemu/app/modules/profile/views/section/logout.dart';
import 'package:essemu/app/modules/profile/views/section/more_card.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../components/spacer/sliver_spacer.dart';
import '../controllers/profile_controller.dart';
import 'section/appbar.dart';
import 'section/avatar.dart';

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
            body: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(2.seconds, () {
                  c.getUser();
                });
              },
              child: CustomScrollView(
                slivers: [
                  AppBars(),
                  SliverSpacerV(hight: 20),
                  AvatarSection(),
                  SliverSpacerV(hight: 22),
                  CardBioSection(),
                  SliverSpacerV(hight: 12),
                  MoreCardSection(),
                  SliverSpacerV(hight: 12),
                  LogoutSection(),
                  SliverSpacerV(hight: 22),

                  // HeaderSection(),
                  // FormSection(),
                  // LogoutSection()
                ],
              ),
            )),
      );
    });
  }
}
