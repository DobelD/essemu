import 'package:essemu/app/provider/endpoint.dart';

import '../../../data/courier.dart';

class CourierService {
  Endpoint endpoint = Endpoint();
  Future<List<Courier>> getData(int id) async {
    try {
      final response = await endpoint.getCourier(id);
      final List<Courier> courier = [];
      for (var data in response) {
        final crr = Courier.fromJson(data);
        courier.add(crr);
      }
      return courier;
    } catch (e) {
      throw "$e";
    }
  }
}
