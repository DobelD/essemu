import 'package:get/get.dart';

import '../modules/add_menu/bindings/add_menu_binding.dart';
import '../modules/add_menu/views/add_menu_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
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
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
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
  ];
}
