import '../../../data/categories.dart';

import '../../../provider/endpoint.dart';

class MenuService {
  Endpoint endpoint = Endpoint();
  Future<List<Menu>> getDataById(int id) async {
    try {
      final response = await endpoint.getMenuById(id);
      final List<Menu> menu = [];
      for (var data in response) {
        final ctg = Menu.fromJson(data);
        menu.add(ctg);
      }
      return menu;
    } catch (e) {
      throw "$e";
    }
  }

  Future<List<Menu>> getData() async {
    try {
      final response = await endpoint.getMenu();
      final List<Menu> menu = [];
      for (var data in response) {
        final ctg = Menu.fromJson(data);
        menu.add(ctg);
      }
      return menu;
    } catch (e) {
      throw "$e";
    }
  }

  Future<bool> delete(int id) async {
    await endpoint.deleteMenu(id);
    if (id != 0) {
      return true;
    } else {
      return false;
    }
  }
}
