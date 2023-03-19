import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../controllers/main_pages_controller.dart';

class MainPagesView extends GetView<MainPagesController> {
  const MainPagesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
              _itemBar(IconlyBold.home, ''),
              _itemBar(IconlyBold.heart, ''),
              _itemBar(IconlyBold.document, ''),
              _itemBar(IconlyBold.profile, ''),
            ]),
      );
    });
  }
}

_itemBar(IconData icon, String label) {
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}
