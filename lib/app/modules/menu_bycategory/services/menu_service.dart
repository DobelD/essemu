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
}
