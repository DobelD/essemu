import 'package:essemu/app/provider/endpoint.dart';

import '../../../data/categories.dart';

class CategoryApi {
  Endpoint endpoint = Endpoint();
  Future<List<Categories>> getCategory() async {
    final response = await endpoint.getCategory();

    final List<Categories> category = [];

    for (final data in response) {
      final ctg = Categories.fromJson(data);
      category.add(ctg);
    }

    return category;
  }
}
