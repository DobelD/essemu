import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/item_order.dart';
import '../../../provider/endpoint.dart';

class ItemOrderService {
  SupabaseClient client = Supabase.instance.client;

  Stream<List<ItemOrder>> getData(int? id) async* {
    final menuClient = client.from('menu');
    final favoriteStream = client
        .from('order_item')
        .stream(primaryKey: ['id']).eq('order_id', id ?? 0);
    await for (final snap in favoriteStream) {
      final itemList = <ItemOrder>[];
      for (final data in snap) {
        final menuId = data['menu_id'];
        final menuData =
            await menuClient.select('*').eq('id', menuId ?? 0).single();
        final menu = Menu.fromJson(menuData);
        final favorite = ItemOrder.fromJson(data, menu: menu);
        itemList.add(favorite);
      }
      yield itemList;
    }
  }

  Endpoint endpoint = Endpoint();

  Future<List<ItemOrder>> getDatas(int id) async {
    try {
      final response = await endpoint.getItemOrder(id);
      return response;
    } catch (e) {
      throw "$e";
    }
  }
}
