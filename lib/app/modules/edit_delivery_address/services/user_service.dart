import '../../../provider/endpoint.dart';

class UpdateService {
  Endpoint endpoint = Endpoint();
  Future<void> update(int id, String name, String phone, String address) async {
    try {
      final response = await endpoint.updateUserCheckout(
          id, name, int.parse(phone), address);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
