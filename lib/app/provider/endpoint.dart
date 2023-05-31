import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/cart_order.dart';
import '../data/item_order.dart' as i;

class Endpoint {
  SupabaseClient client = Supabase.instance.client;

  register(String email, String password) async {
    final regs = await client.auth.signUp(email: email, password: password);
    return regs;
  }

  addUsers(dynamic user) async {
    final add = await client.from('users').insert([user]);
    return add;
  }

  setEmail(String email) async {
    final emailSet =
        await client.from('users').select('*').eq('email', email).single();
    return emailSet;
  }

  setEmailRest(String email) async {
    final emailSet =
        await client.from('restaurant').select('*').eq('email', email).single();
    return emailSet;
  }

  setId(String id) async {
    final idSet = await client.from('users').select('*').eq('id', id).single();
    return idSet;
  }

  getRole(dynamic user) async {
    final role = await client
        .from('role')
        .select('name')
        .eq('id', user['role_id'])
        .single();
    return role;
  }

  getCategory() async {
    final category = await client
        .from('categories')
        .select('*, menu(*)')
        .order('name', ascending: true);
    return category;
  }

  getUsers(String email) async {
    final users =
        await client.from('users').select('*').eq('email', email).single();
    return users;
  }

  getUsersRest(String email) async {
    final users =
        await client.from('restaurant').select('*').eq('email', email).single();
    return users;
  }

  getUsersId(int id) async {
    final users = await client.from('users').select('*').eq('id', id).single();
    return users;
  }

  getMenu() async {
    final menu = await client
        .from('menu')
        .select('*, categories!inner(*), restaurant!inner(coordinate)');
    return menu;
  }

  getMenuById(int id) async {
    final menu = await client
        .from('menu')
        .select('*, categories!inner(*), restaurant!inner(coordinate)')
        .eq('category_id', id);
    return menu;
  }

  deleteFavorite(int menuId, int userId) async {
    final del = await client
        .from('favorite')
        .delete()
        .match({'menu_id': menuId, 'user_id': userId});
    return del;
  }

  getMenuImage() async {
    final imageMenu = await client.storage.from('orderfood').list();
    return imageMenu;
  }

  getFavoriteMenu(int id) async {
    try {
      final favorite =
          client.from('favorite').stream(primaryKey: ['id']).eq('user_id', id);
      return favorite;
    } catch (e) {
      print(e);
    }
  }

  getFavoriteBool(int id) async {
    final fav = await client.from('favorite').select('*').eq('user_id', id);
    return fav;
  }

  getItemById(int id) async {
    final item = await client
        .from('order_item')
        .stream(primaryKey: ['id']).eq('order_id', id);
    return item;
  }

  getMenuByUserId(int id) async {
    final menu = await client
        .from('order_item')
        .select('*, categories!inner(name), restaurant!inner(coordinate)')
        .eq('id', id)
        .single();
    return menu;
  }

  addFavorite(dynamic payload) async {
    final fav = await client.from('favorite').insert(payload);
    return fav;
  }

  addToCart(Map<String, dynamic> value) async {
    try {
      final add = await client.from('cart').insert([value]);
      return add;
    } catch (e) {
      throw Exception(e);
    }
  }

  checkCart(int id) async {
    try {
      final cart = await client.from('cart').select('*');
      return cart;
    } catch (e) {
      throw Exception(e);
    }
  }

  addMenu(Map<String, dynamic> value) async {
    try {
      final add = await client.from('menu').insert([value]);
      return add;
    } catch (e) {
      throw Exception(e);
    }
  }

  addImagesMenu(String name, String path) async {
    final image = await client.storage.from('orderfood').upload(
        '$name', File(path),
        fileOptions: const FileOptions(cacheControl: '3600', upsert: false));
    return image;
  }

  storage() async {
    final storages = await client.storage.from('orderfood');
    return storages;
  }

  addCategory(dynamic value) async {
    final add = await client.from('categories').insert(value);
    return add;
  }

  addImageCategory(String name, String path) async {
    final image = await client.storage.from('category').upload(
        '$name', File(path),
        fileOptions: const FileOptions(cacheControl: '3600', upsert: false));
    return image;
  }

  Future<List<CartOrder>> getCart(int id) async {
    final menuClient = client.from('menu');
    final cartFuture = client
        .from('cart')
        .stream(primaryKey: ['id'])
        .eq('user_id', id)
        .order('id', ascending: true);
    await for (final snap in cartFuture) {
      final cartList = <CartOrder>[];
      for (final data in snap) {
        final menuId = data['menu_id'];
        final menuData = await menuClient
            .select(
                '*, categories!inner(name), restaurant!inner(id,coordinate,delivery_fee)')
            .eq('id', menuId)
            .single();
        final menu = Menu.fromJson(menuData);
        final cart = CartOrder.fromJson(data, menu: menu);
        cartList.add(cart);
      }
      return cartList;
    }
    throw 'Gagal';
  }

  Future<List<i.ItemOrder>> getItemOrder(int id) async {
    final menuClient = client.from('menu');
    final itemFuture = client
        .from('order_item')
        .stream(primaryKey: ['id'])
        .eq('order_id', id)
        .order('id', ascending: true);
    await for (final snap in itemFuture) {
      final itemList = <i.ItemOrder>[];
      for (final data in snap) {
        final menuId = data['menu_id'];
        final menuData = await menuClient
            .select(
                '*, categories!inner(name), restaurant!inner(id,coordinate,delivery_fee)')
            .eq('id', menuId)
            .single();
        final menu = i.Menu.fromJson(menuData);
        final cart = i.ItemOrder.fromJson(data, menu: menu);
        itemList.add(cart);
      }
      return itemList;
    }
    throw 'Gagal';
  }

  deleteItemCart(int userId, int menuId) async {
    final item = await client
        .from('cart')
        .delete()
        .eq('user_id', userId)
        .eq('menu_id', menuId);
    return item;
  }

  deleteOrder(int userId) async {
    final item = await client.from('order').delete().eq('user_id', userId);
    return item;
  }

  deleteItemOrder(int orderId) async {
    final item =
        await client.from('order_item').delete().eq('order_id', orderId);
    return item;
  }

  updateItemCart(int userId, int menuId, int count) async {
    final item = await client
        .from('cart')
        .update({'qty': count})
        .eq('user_id', userId)
        .eq('menu_id', menuId);
    return item;
  }

  getRestaurant() async {
    final rest = await client.from('restaurant').select('id,delivery_fee');
    return rest;
  }

  createOrder(Map<String, dynamic> value) async {
    try {
      final add = await client.from('order').insert([value]);
      return add;
    } catch (e) {
      throw Exception(e);
    }
  }

  checkout(List<Map<String, dynamic>> value) async {
    try {
      final add = await client.from('order_item').insert(value);
      print(add);
      return add;
    } catch (e) {
      throw Exception(e);
    }
  }

  deleteCart(int userId) async {
    final item = await client.from('cart').delete().eq('user_id', userId);
    return item;
  }

  getOrder(int id) async {
    final order = await client
        .from('order')
        .select('*')
        .eq('user_id', id)
        .order('order_date',
            ascending:
                false) // Mengurutkan berdasarkan created_at secara menurun (terbaru ke terlama)
        .limit(1);
    return order;
  }

  getOrderRest(int id) async {
    final order = await client
        .from('order')
        .select('*, users!inner(id,name,phone)')
        .eq('restaurant_id', id);
    return order;
  }

  getHistory(int id) async {
    final history = await client
        .from('history')
        .select('*, restaurant!inner(name,address,phone)')
        .eq('user_id', id);
    return history;
  }

  getHistoryRest(int id) async {
    final history = await client
        .from('history')
        .select('*, users!inner(*)')
        .eq('restaurant_id', id);
    return history;
  }

  getHistoryById(int id) async {
    final history = await client
        .from('history')
        .select('*')
        .eq('user_id', id)
        .order('created_at',
            ascending:
                false) // Mengurutkan berdasarkan created_at secara menurun (terbaru ke terlama)
        .limit(1);
    print(history);
    return history;
  }

  createHistory(Map<String, dynamic> value) async {
    try {
      final add = await client.from('history').insert([value]);
      return add;
    } catch (e) {
      throw Exception(e);
    }
  }

  createItemHistory(List<Map<String, dynamic>> value) async {
    try {
      final add = await client.from('history_item').insert(value);
      print(add);
      return add;
    } catch (e) {
      throw Exception(e);
    }
  }

  updateStatus(int userId) async {
    final item = await client
        .from('order')
        .update({'status': 'proses'}).eq('user_id', userId);
    return item;
  }

  updateStatusSend(int userId, int idCourier) async {
    final item = await client.from('order').update(
        {'status': 'antar', 'courier_id': idCourier}).eq('user_id', userId);
    return item;
  }

  updateStatusCencel(int userId) async {
    final item = await client
        .from('order')
        .update({'status': 'tolak'}).eq('user_id', userId);
    return item;
  }

  updateStatusDone(int userId) async {
    final item = await client
        .from('order')
        .update({'status': 'selesai'}).eq('user_id', userId);
    return item;
  }

  updateUserCheckout(int id, String name, int phone, String address) async {
    final item = await client.from('users').update(
        {'name': name, 'phone': phone, 'address': address}).eq('id', id);
    return item;
  }

  getHistoryItem(int id) async {
    final item = await client
        .from('history_item')
        .select('*, menu!inner(name,price)')
        .eq('history_id', id);
    return item;
  }

  addCourier(dynamic value) async {
    final add = await client.from('courier').insert(value);
    return add;
  }

  deleteCourier(int id) async {
    final add = await client.from('courier').delete().eq('id', id);
    return add;
  }

  getCourier(int id) async {
    final order = await client
        .from('courier')
        .select('id,name,phone')
        .eq('restaurant_id', id);
    return order;
  }
}
