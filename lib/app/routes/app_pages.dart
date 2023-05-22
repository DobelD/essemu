import 'package:get/get.dart';

import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/add_category/bindings/add_category_binding.dart';
import '../modules/add_category/views/add_category_view.dart';
import '../modules/add_menu/bindings/add_menu_binding.dart';
import '../modules/add_menu/views/add_menu_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/carts/bindings/carts_binding.dart';
import '../modules/carts/views/carts_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/detail_menu/bindings/detail_menu_binding.dart';
import '../modules/detail_menu/views/detail_menu_view.dart';
import '../modules/detail_order/bindings/detail_order_binding.dart';
import '../modules/detail_order/views/detail_order_view.dart';
import '../modules/favorite/bindings/favorite_binding.dart';
import '../modules/favorite/views/favorite_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main_admin/bindings/main_admin_binding.dart';
import '../modules/main_admin/views/main_admin_view.dart';
import '../modules/main_pages/bindings/main_pages_binding.dart';
import '../modules/main_pages/views/main_pages_view.dart';
import '../modules/menu/bindings/menu_binding.dart';
import '../modules/menu/views/menu_view.dart';
import '../modules/ongkir/bindings/ongkir_binding.dart';
import '../modules/ongkir/views/ongkir_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_PAGES,
      page: () => const MainPagesView(),
      binding: MainPagesBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => const FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_ADMIN,
      page: () => const MainAdminView(),
      binding: MainAdminBinding(),
    ),
    GetPage(
      name: _Paths.MENU,
      page: () => const MenuView(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: _Paths.ADD_MENU,
      page: () => const AddMenuView(),
      binding: AddMenuBinding(),
    ),
    GetPage(
      name: _Paths.ADD_CATEGORY,
      page: () => const AddCategoryView(),
      binding: AddCategoryBinding(),
    ),
    GetPage(
      name: _Paths.ONGKIR,
      page: () => const OngkirView(),
      binding: OngkirBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_MENU,
      page: () => const DetailMenuView(),
      binding: DetailMenuBinding(),
    ),
    GetPage(
      name: _Paths.CARTS,
      page: () => const CartsView(),
      binding: CartsBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ORDER,
      page: () => const DetailOrderView(),
      binding: DetailOrderBinding(),
    ),
  ];
}
