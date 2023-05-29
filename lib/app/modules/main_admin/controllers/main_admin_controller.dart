import 'package:essemu/app/modules/add_menu/views/add_menu_view.dart';
import 'package:essemu/app/modules/history_resto/views/history_resto_view.dart';
import 'package:essemu/app/modules/order_proccess/views/order_proccess_view.dart';
import 'package:essemu/app/modules/setting/views/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainAdminController extends GetxController {
  var indexTab = Get.arguments ?? 0;
  void changeIndexTab(int index) {
    indexTab = index;
    update();
  }

  List<Widget> pages = [
    OrderProccessView(),
    HistoryRestoView(),
    AddMenuView(),
    SettingView()
  ];

  // bool isLoading = false;
  // SupabaseClient client = Supabase.instance.client;
  // var indexPage;
  // void changePages(int index) {
  //   Get.back();
  //   indexPage = index;
  //   update();
  // }

  // var page = [
  //   DashboardView(),
  //   AddCategoryView(),
  //   AddMenuView(),
  //   OngkirView(),
  //   SettingView(),
  //   AboutView()
  // ];

  // var currentPage = DrawerSections.dashboard;
  // var container;

  // gotoPage(int id) {
  //   Get.back();
  //   if (id == 1) {
  //     currentPage = DrawerSections.dashboard;
  //   } else if (id == 2) {
  //     currentPage = DrawerSections.tambah_kategori;
  //   } else if (id == 3) {
  //     currentPage = DrawerSections.tambah_menu;
  //   } else if (id == 4) {
  //     currentPage = DrawerSections.ongkos_kirim;
  //   } else if (id == 5) {
  //     currentPage = DrawerSections.setting;
  //   } else if (id == 6) {
  //     currentPage = DrawerSections.about;
  //   }
  //   update();
  // }

  // logout() async {
  //   Get.back();
  //   isLoading = true;
  //   update();
  //   await client.auth.signOut();
  //   session.clearSession();
  //   isLoading = false;
  //   update();
  //   Get.offAllNamed(Routes.AUTH);
  // }
}

enum DrawerSections {
  dashboard,
  tambah_kategori,
  tambah_menu,
  ongkos_kirim,
  setting,
  about
}
