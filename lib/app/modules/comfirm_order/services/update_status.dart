import '../../../provider/endpoint.dart';

class UpdateStatusOrder {
  Endpoint endpoint = Endpoint();

  Future<void> proccess(int userId) async {
    try {
      final response = await endpoint.updateStatusSend(userId);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
