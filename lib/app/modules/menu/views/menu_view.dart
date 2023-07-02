import 'package:essemu/app/modules/menu/controllers/menu_controller.dart';
import 'package:essemu/app/routes/app_pages.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'section/app_bar.dart';
import 'section/menu.dart';

class MenuView extends GetView<MenuControllers> {
  const MenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MenuControllers());
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
