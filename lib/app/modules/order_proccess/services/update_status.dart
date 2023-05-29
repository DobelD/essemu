import '../../../provider/endpoint.dart';

class UpdateStatusOrder {
  Endpoint endpoint = Endpoint();

  Future<void> proccess(int userId) async {
    try {
      final response = await endpoint.updateStatus(userId);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> cencel(int userId) async {
    try {
      final response = await endpoint.updateStatusCencel(userId);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> done(int userId) async {
    try {
      final response = await endpoint.updateStatusDone(userId);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
