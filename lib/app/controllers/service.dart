import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/order.dart';
import '../provider/endpoint.dart';

class OrderService {
  SupabaseClient client = Supabase.instance.client;

  Stream<Order> getData(int id) async* {
    final orderStream =
        client.from('order').stream(primaryKey: ['id']).eq('user_id', id);
    await for (final snap in orderStream) {
      final itemList = <Order>[];
      for (final data in snap) {
        final order = Order.fromJson(data);
        itemList.add(order);
      }
      yield itemList.first;
    }
  }

  Stream<List<Order>> getDatae(int id) async* {
    final orderStream =
        client.from('order').stream(primaryKey: ['id']).eq('restaurant_id', id);
    await for (final snap in orderStream) {
      final itemList = <Order>[];
      for (final data in snap) {
        final order = Order.fromJson(data);
        itemList.add(order);
      }
      yield itemList;
    }
  }

  Endpoint endpoint = Endpoint();

  Future<List<Order>> getDatas(int id) async {
    try {
      final response = await endpoint.getOrder(id);
      final List<Order> order = [];
      for (var data in response) {
        final ctg = Order.fromJson(data);
        order.add(ctg);
      }
      print(order);
      return order;
    } catch (e) {
      throw "$e";
    }
  }
}
