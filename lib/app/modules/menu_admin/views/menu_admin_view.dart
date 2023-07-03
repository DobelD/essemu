import 'package:essemu/app/components/spacer/sliver_spacer.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/menu_admin_controller.dart';
import 'section/app_bar.dart';
import 'section/menu.dart';

class MenuAdminView extends GetView<MenuAdminController> {
  const MenuAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MenuAdminController());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          child: const Icon(
            Icons.add,
            color: kWhite,
          ),
          onPressed: () => Get.toNamed(Routes.ADD_MENU,
              arguments: {'action': 'add', 'menu': 'menu'}),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(2.seconds, () => controller.getCategory());
          },
          child: CustomScrollView(
            slivers: [AppBarSection(), MenuSection(), SliverSpacerV(hight: 62)],
          ),
        ));
  }
}
