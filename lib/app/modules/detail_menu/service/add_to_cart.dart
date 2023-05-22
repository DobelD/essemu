import 'package:essemu/app/provider/endpoint.dart';

class AddToCart {
  Endpoint endpoint = Endpoint();
  Future<void> incrementItem(
      int userId, int menuId, int secondCount, int count) async {
    try {
      final response =
          await endpoint.updateItemCart(userId, menuId, secondCount + count);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
