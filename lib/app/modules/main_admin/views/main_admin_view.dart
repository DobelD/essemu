import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

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
              _itemBar(IconlyBold.document, ''),
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
