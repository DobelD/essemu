import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/order.dart';
import '../../../provider/endpoint.dart';

class OrderService {
  SupabaseClient client = Supabase.instance.client;

  Stream<Map<String, dynamic>> getData(int? id) async* {
    final orderStream =
        client.from('order').stream(primaryKey: ['id']).eq('user_id', id ?? 0);
    // .order('order_date', ascending: true)
    // .limit(1);
    Map<String, dynamic> dataSnap = {};
    await for (final snap in orderStream) {
      for (final data in snap) {
        dataSnap = data;
      }
      yield dataSnap;
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
