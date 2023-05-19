import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class Endpoint {
  SupabaseClient client = Supabase.instance.client;

  setEmail(String email) async {
    final emailSet =
        await client.from('users').select('*').eq('email', email).single();
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

  getMenu() async {
    final menu = await client
        .from('menu')
        .select('*, categories!inner(name), restaurant!inner(coordinate)');
    return menu;
  }

  getMenuById(int id) async {
    final menu = await client
        .from('menu')
        .select('*, categories!inner(name), restaurant!inner(coordinate)')
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
}
