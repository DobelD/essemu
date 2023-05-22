import '../../../provider/endpoint.dart';

class UpdateItemCart {
  Endpoint endpoint = Endpoint();

  Future<void> incrementItem(int userId, int menuId, int count) async {
    try {
      final response = await endpoint.updateItemCart(userId, menuId, count + 1);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> decrementItem(int userId, int menuId, int count) async {
    try {
      final response = await endpoint.updateItemCart(userId, menuId, count - 1);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
