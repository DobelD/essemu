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
              _itemBar(
                  SvgPicture.asset(
                      controller.indexTab == 0
                          ? SgAssets.homes
                          : SgAssets.uhomes,
                      height: 24,
                      width: 24),
                  ''),
              _itemBar(
                  SvgPicture.asset(
                      controller.indexTab == 1 ? SgAssets.list : SgAssets.ulist,
                      height: 24,
                      width: 24),
                  ''),
              _itemBar(
                  SvgPicture.asset(
                      controller.indexTab == 2
                          ? SgAssets.favorites
                          : SgAssets.ufavorites,
                      height: 24,
                      width: 24),
                  ''),
              _itemBar(
                  SvgPicture.asset(
                      controller.indexTab == 3
                          ? SgAssets.users
                          : SgAssets.uusers,
                      height: 24,
                      width: 24),
                  ''),
            ]),
      );
    });
  }
}

_itemBar(Widget icon, String label) {
  return BottomNavigationBarItem(icon: icon, label: label);
}
