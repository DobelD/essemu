import 'package:essemu/app/data/courier.dart';
import 'package:essemu/app/provider/endpoint.dart';

class CourierService {
  Endpoint endpoint = Endpoint();

  Future<bool> addCourier(int id, String name, int phone) async {
    if (name.isNotEmpty) {
      await endpoint.addCourier(payload(id, name, phone));
      return true;
    } else {
      return false;
    }
  }

  Map<String, dynamic> payload(int id, String name, int phone) {
    Map<String, dynamic> temp = <String, dynamic>{};
    temp['restaurant_id'] = id;
    temp['name'] = name;
    temp['phone'] = phone;
    return temp;
  }

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

  Future<bool> delete(int id) async {
    await endpoint.deleteCourier(id);
    if (id != 0) {
      return true;
    } else {
      return false;
    }
  }
}
