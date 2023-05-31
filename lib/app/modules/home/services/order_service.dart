import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/order.dart';
import '../../../provider/endpoint.dart';

class OrderService {
  SupabaseClient client = Supabase.instance.client;

  Stream<Map<String, dynamic>> getData(int id) async* {
    final orderStream =
        client.from('order').stream(primaryKey: ['id']).eq('user_id', id);
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

  Future<Order> getDatas(int id) async {
    try {
      final response = await endpoint.getOrder(id);
      List<dynamic> data = response;
      final orderData = data.first;
      print(orderData);
      return Order(
          id: orderData['id'],
          userId: orderData['user_id'],
          orderDate: orderData['order_date'],
          totalPrice: orderData['total_price'],
          status: orderData['status'],
          restaurantId: orderData['restaurant_id'],
          deliveryFee: orderData['delivery_fee'],
          avgDuration: orderData['avg_duration'],
          courierId: orderData['courier_id']);
    } catch (e) {
      throw "$e";
    }
  }
}
