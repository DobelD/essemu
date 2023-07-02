import 'dart:async';

import '../../../data/order.dart';
import '../../../provider/endpoint.dart';

class OrderService {
  Endpoint endpoint = Endpoint();

  Future<List<Order>> getData(int id) async {
    try {
      final response = await endpoint.getOrder(id);
      final List<Order> order = [];
      for (var data in response) {
        final ctg = Order.fromJson(data);
        order.add(ctg);
      }
      return order;
    } catch (e) {
      throw "$e";
    }
  }
}
