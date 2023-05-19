import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/item_order.dart';

class ItemOrderService {
  SupabaseClient client = Supabase.instance.client;

  Stream<List<ItemOrder>> getData(int id) async* {
    final menuClient = client.from('menu');
    final favoriteStream =
        client.from('order_item').stream(primaryKey: ['id']).eq('order_id', id);
    await for (final snap in favoriteStream) {
      final itemList = <ItemOrder>[];
      for (final data in snap) {
        final menuId = data['menu_id'];
        final menuData = await menuClient.select('*').eq('id', menuId).single();
        final menu = Menu.fromJson(menuData);
        final favorite = ItemOrder.fromJson(data, menu: menu);
        itemList.add(favorite);
      }
      print(itemList);
      yield itemList;
    }
  }
}
