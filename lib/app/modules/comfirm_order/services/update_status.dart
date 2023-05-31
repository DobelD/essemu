import '../../../provider/endpoint.dart';

class UpdateStatusOrder {
  Endpoint endpoint = Endpoint();

  Future<void> proccess(int userId, int idCourier) async {
    try {
      final response = await endpoint.updateStatusSend(userId, idCourier);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
