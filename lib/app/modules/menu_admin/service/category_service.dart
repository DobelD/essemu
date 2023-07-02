import '../../../data/categories.dart';
import '../../../provider/endpoint.dart';

class CategoryService {
  Endpoint endpoint = Endpoint();
  Future<List<Categories>> getData() async {
    try {
      final response = await endpoint.getCategory();
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
