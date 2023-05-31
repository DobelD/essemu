import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../components/loading_action/loading_action.dart';
import '../../../components/spacer/sliver_spacer.dart';
import '../../../themes/colors/colors.dart';
import '../controllers/setting_controller.dart';
import 'section/appbar.dart';
import 'section/avatar.dart';
import 'section/card_bio.dart';
import 'section/logout.dart';
import 'section/more_card.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SupabaseClient client = Supabase.instance.client;
    final controller = Get.put(SettingController());

    return GetBuilder<SettingController>(builder: (c) {
      return AppLoading(
        isLoading: controller.isLoading,
        child: Scaffold(
            backgroundColor: kMainBackground,
            body: CustomScrollView(
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
              ],
            )),
      );
    });
  }
}
