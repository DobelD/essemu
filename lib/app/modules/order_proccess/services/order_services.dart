import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/item_order.dart';
// import '../../../data/order_rest.dart';
import '../../../data/order_rest.dart' as r;
import '../../../data/orders.dart';
import '../../../provider/endpoint.dart';

import '../../../data/user.dart' as u;

class OrderService {
  SupabaseClient client = Supabase.instance.client;

  Endpoint endpoint = Endpoint();

  Future<List<r.OrderRest>> getDatad(int id) async {
    try {
      final response = await endpoint.getOrderRest(1);
      final List<r.OrderRest> order = [];
      for (var data in response) {
        final ctg = r.OrderRest.fromJson(data);
        order.add(ctg);
      }
      print(order);
      return order;
    } catch (e) {
      throw "$e";
    }
  }

  Stream<List<Order>> getDatae(int id) async* {
    final userClient = client.from('users');
    final orderStream = client
        .from('order')
        .stream(primaryKey: ['id'])
        .eq('restaurant_id', 1)
        .order('id', ascending: true);
    await for (final snap in orderStream) {
      final dataSnap = <Order>[];
      for (final data in snap) {
        final userId = data['user_id'];
        final userData =
            await userClient.select('id, name,phone').eq('id', userId).single();
        final user = Users.fromJson(userData);
        final item = Order.fromJson(data, user: user);
        dataSnap.add(item);
      }
      print("DTR ${dataSnap}");
      yield dataSnap;
    }
  }

  Stream<List<Order>> getDataes(int id) async* {
    final userClient = client.from('users');
    final orderStream = client
        .from('order')
        .stream(primaryKey: ['id'])
        .eq('restaurant_id', 1)
        .order('avg_duration', ascending: true);
    await for (final snap in orderStream) {
      final dataSnap = <Order>[];
      for (final data in snap) {
        final userId = data['user_id'];
        final userData =
            await userClient.select('id, name,phone').eq('id', userId).single();
        final user = Users.fromJson(userData);
        final item = Order.fromJson(data, user: user);
        dataSnap.add(item);
      }
      print("DTR ${dataSnap}");
      yield dataSnap;
    }
  }

  Future<List<ItemOrder>> getData(int id) async {
    try {
      final response = await endpoint.getItemOrder(id);
      return response;
    } catch (e) {
      throw "$e";
    }
  }

  Future<u.User> getDatas(int id) async {
    try {
      final response = await endpoint.getUsersId(id);
      return u.User.fromJson(response);
    } catch (e) {
      throw "$e";
    }
  }
}
