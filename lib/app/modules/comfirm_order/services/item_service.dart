import '../../../data/item_order.dart';
import '../../../provider/endpoint.dart';

class ItemService {
  Endpoint endpoint = Endpoint();

  Future<List<ItemOrder>> getData(int id) async {
    try {
      final response = await endpoint.getItemOrder(id);
      return response;
    } catch (e) {
      throw "$e";
    }
  }
}
