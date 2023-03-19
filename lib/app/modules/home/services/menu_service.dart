import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/categories.dart';

class MenuService {
  SupabaseClient client = Supabase.instance.client;
  Future<List<Menu>> getDataById(int id) async {
    try {
      final response =
          await client.from('menu').select('category_id').eq('category_id', id);
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
      final response = await client.from('menu').select('*');
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
