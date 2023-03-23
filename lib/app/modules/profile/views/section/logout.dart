import 'package:essemu/app/components/button/app_button_primary.dart';
import 'package:essemu/app/modules/profile/controllers/profile_controller.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutSection extends StatelessWidget {
  const LogoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return SliverToBoxAdapter(
        child: Padding(
            padding: DefaultPadding.side,
            child: AppButtonPrimary(
                label: 'Logout', onPressed: () => controller.logout())));
  }
}
