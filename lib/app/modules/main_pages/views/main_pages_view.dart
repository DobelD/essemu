import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../utils/assets/svg/svg_assets.dart';
import '../controllers/main_pages_controller.dart';

class MainPagesView extends GetView<MainPagesController> {
  const MainPagesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainPagesController());
    return GetBuilder<MainPagesController>(builder: (context) {
      return Scaffold(
        backgroundColor: kMainBackground,
        body: IndexedStack(
          index: controller.indexTab,
          children: controller.pages,
        ),
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
                      controller.indexTab == 1
                          ? SgAssets.favorites
                          : SgAssets.ufavorites,
                      height: 24,
                      width: 24),
                  ''),
              _itemBar(
                  SvgPicture.asset(
                      controller.indexTab == 2 ? SgAssets.list : SgAssets.ulist,
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
