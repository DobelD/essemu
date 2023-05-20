import '../../../provider/endpoint.dart';

class DeleteItemCart {
  Endpoint endpoint = Endpoint();

  Future<void> deleteItem(int userId, int menuId) async {
    try {
      final response = await endpoint.deleteItemCart(userId, menuId);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
