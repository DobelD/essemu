import 'dart:async';

import '../../../data/cart_order.dart';
import '../../../provider/endpoint.dart';

class CartService {
  Endpoint endpoint = Endpoint();

  Future<List<CartOrder>> getData(int id) async {
    try {
      final response = await endpoint.getCart(id);
      return response;
    } catch (e) {
      throw "$e";
    }
  }
}
