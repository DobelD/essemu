import 'package:essemu/app/modules/favorite/views/favorite_view.dart';
import 'package:essemu/app/modules/history/views/history_view.dart';
import 'package:essemu/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';

class MainPagesController extends GetxController {
  var indexTab = Get.arguments ?? 0;
  void changeIndexTab(int index) {
    indexTab = index;
    update();
  }

  List<Widget> pages = [
    HomeView(),
    FavoriteView(),
    HistoryView(),
    ProfileView()
  ];

  @override
  void onInit() {
    print(indexTab);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
