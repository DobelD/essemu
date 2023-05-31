import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/order.dart';
import '../../../provider/endpoint.dart';

class OrderService {
  SupabaseClient client = Supabase.instance.client;

  Stream<Order> getData(int id) async* {
    final courier = client.from('courier');
    final orderStream =
        client.from('order').stream(primaryKey: ['id']).eq('user_id', id);
    await for (final snap in orderStream) {
      final itemList = <Order>[];
      for (final data in snap) {
        final crId = data['courier_id'];
        final crData =
            await courier.select('id,name,phone').eq('id', crId).single();
        final courierJson = Courier.fromJson(crData);
        final order = Order.fromJson(data, courier: courierJson);
        itemList.add(order);
      }
      yield itemList.first;
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
