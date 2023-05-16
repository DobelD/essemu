import 'package:supabase_flutter/supabase_flutter.dart';

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
        print(data);
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
        print(data);
      }
      return menu;
    } catch (e) {
      throw "$e";
    }
  }

  SupabaseClient client = Supabase.instance.client;

  Future<List<String>> getImages() async {
    final storage = client.storage.from('orderfood');
    // final id = storage.url;
    final response = await storage.list();
    final urls =
        response.map((file) => storage.getPublicUrl(file.name)).toList();
    print(urls);
    return urls;
  }
}
