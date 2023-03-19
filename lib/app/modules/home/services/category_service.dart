import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/categories.dart';

class CategoryService {
  SupabaseClient client = Supabase.instance.client;
  Future<List<Categories>> getData() async {
    try {
      final response = await client
          .from('categories')
          .select('*, menu(*)')
          .order('name', ascending: true);

      final List<Categories> category = [];

      for (var data in response) {
        final ctg = Categories.fromJson(data);
        category.add(ctg);
      }
      return category;
    } catch (e) {
      throw "$e";
    }
  }
}
