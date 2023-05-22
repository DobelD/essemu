import '../../../provider/endpoint.dart';

class DeleteOrder {
  Endpoint endpoint = Endpoint();

  Future<void> deleteOrder(int userId) async {
    try {
      final response = await endpoint.deleteOrder(userId);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteItem(int orderId) async {
    try {
      final response = await endpoint.deleteItemOrder(orderId);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
