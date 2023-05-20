import 'dart:async';

import '../../../data/cart_order.dart';
import '../../../provider/endpoint.dart';

class CartService {
  // SupabaseClient client = Supabase.instance.client;

  // Stream<List<CartOrder>> getData(int id) async* {
  //   final menuClient = client.from('menu');
  //   final cartStream =
  //       client.from('cart').stream(primaryKey: ['id']).eq('user_id', id);
  //   await for (final snap in cartStream) {
  //     final cartList = <CartOrder>[];
  //     for (final data in snap) {
  //       final menuId = data['menu_id'];
  //       final menuData = await menuClient
  //           .select('*, categories!inner(name), restaurant!inner(coordinate)')
  //           .eq('id', menuId)
  //           .single();
  //       final menu = Menu.fromJson(menuData);
  //       final cart = CartOrder.fromJson(data, menu: menu);
  //       cartList.add(cart);
  //     }

  //     yield cartList;
  //   }
  // }

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
