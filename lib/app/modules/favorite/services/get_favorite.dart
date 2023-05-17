import 'dart:async';

import 'package:essemu/app/data/favorite.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoriteService {
  SupabaseClient client = Supabase.instance.client;

  Stream<List<Favorite>> getData(int id) async* {
    final menuClient = client.from('menu');
    final favoriteStream =
        client.from('favorite').stream(primaryKey: ['id']).eq('user_id', id);
    await for (final snap in favoriteStream) {
      final favoriteList = <Favorite>[];
      for (final data in snap) {
        final menuId = data['menu_id'];

        final menuData = await menuClient
            .select('*, categories!inner(name), restaurant!inner(coordinate)')
            .eq('id', menuId)
            .single();
        final menu = Menu.fromJson(menuData);
        final favorite = Favorite.fromJson(data, menu: menu);
        favoriteList.add(favorite);
      }

      yield favoriteList;
    }
  }
}
