import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class Endpoint {
  SupabaseClient client = Supabase.instance.client;

  setEmail(String email) async {
    final emailSet =
        await client.from('users').select('*').eq('email', email).single();
    return emailSet;
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

  getMenuImage() async {
    final imageMenu = await client.storage.from('orderfood').list();
    return imageMenu;
  }

  getFavoriteMenu() async {}
  addMenu(dynamic value) async {
    final add = await client.from('menu').insert(value);
    return add;
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
