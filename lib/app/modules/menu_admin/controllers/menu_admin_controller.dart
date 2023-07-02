import 'package:get/get.dart';

import '../../../data/categories.dart';
import '../service/menu_service.dart';

class MenuAdminController extends GetxController {
  List<Menu> _menu = [];
  List<Menu> get menu => _menu;
  setMenu(List<Menu> data) {
    _menu = menu;
    update();
  }

  getMenu() async {
    final api = MenuService();
    final data = await api.getData();
    print(data.length);
    setMenu(data);
  }

  @override
  void onInit() {
    getMenu();
    super.onInit();
  }
}
