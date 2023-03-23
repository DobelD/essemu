import 'package:essemu/app/modules/add_menu/views/add_menu_view.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/session/session_manager.dart';
import '../../about/views/about_view.dart';
import '../../add_category/views/add_category_view.dart';
import '../../dashboard/views/dashboard_view.dart';
import '../../ongkir/views/ongkir_view.dart';
import '../../setting/views/setting_view.dart';

class MainAdminController extends GetxController {
  bool isLoading = false;
  SupabaseClient client = Supabase.instance.client;
  var indexPage;
  void changePages(int index) {
    Get.back();
    indexPage = index;
    update();
  }

  var page = [
    DashboardView(),
    AddCategoryView(),
    AddMenuView(),
    OngkirView(),
    SettingView(),
    AboutView()
  ];

  var currentPage = DrawerSections.dashboard;
  var container;

  gotoPage(int id) {
    Get.back();
    if (id == 1) {
      currentPage = DrawerSections.dashboard;
    } else if (id == 2) {
      currentPage = DrawerSections.tambah_kategori;
    } else if (id == 3) {
      currentPage = DrawerSections.tambah_menu;
    } else if (id == 4) {
      currentPage = DrawerSections.ongkos_kirim;
    } else if (id == 5) {
      currentPage = DrawerSections.setting;
    } else if (id == 6) {
      currentPage = DrawerSections.about;
    }
    update();
  }

  logout() async {
    Get.back();
    isLoading = true;
    update();
    await client.auth.signOut();
    session.clearSession();
    isLoading = false;
    update();
    Get.offAllNamed(Routes.AUTH);
  }
}

enum DrawerSections {
  dashboard,
  tambah_kategori,
  tambah_menu,
  ongkos_kirim,
  setting,
  about
}
