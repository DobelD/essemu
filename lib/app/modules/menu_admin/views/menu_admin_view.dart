import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../themes/colors/colors.dart';
import '../controllers/menu_admin_controller.dart';
import 'section/app_bar.dart';
import 'section/menu.dart';

class MenuAdminView extends GetView<MenuAdminController> {
  const MenuAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            color: kWhite,
          ),
          onPressed: () => Get.toNamed(Routes.ADD_MENU),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(2.seconds, () => controller.getMenu());
          },
          child: CustomScrollView(
            slivers: [AppBarSection(), MenuSection()],
          ),
        ));
  }
}
