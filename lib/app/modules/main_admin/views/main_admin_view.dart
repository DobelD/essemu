import 'package:essemu/app/utils/assets/svg/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../themes/colors/colors.dart';
import '../controllers/main_admin_controller.dart';

class MainAdminView extends GetView<MainAdminController> {
  const MainAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainAdminController>(builder: (c) {
      return Scaffold(
        body: IndexedStack(index: c.indexTab, children: c.pages),
        bottomNavigationBar: BottomNavigationBar(
            elevation: 1,
            backgroundColor: kWhite,
            currentIndex: controller.indexTab,
            onTap: controller.changeIndexTab,
            type: BottomNavigationBarType.fixed,
            unselectedIconTheme: IconThemeData(color: kSoftGrey),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              _itemBar(SgAssets.shoppingList,
                  controller.indexTab == 0 ? kMain : kGrey3, ''),
              _itemBar(
                  SgAssets.file, controller.indexTab == 1 ? kMain : kGrey3, ''),
              _itemBar(
                  SgAssets.bell, controller.indexTab == 2 ? kMain : kGrey3, ''),
              _itemBar(
                  SgAssets.user, controller.indexTab == 3 ? kMain : kGrey3, ''),
            ]),
      );
    });
  }
}

_itemBar(String icon, Color color, String label) {
  return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        height: 24,
        width: 24,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
      label: label);
}
