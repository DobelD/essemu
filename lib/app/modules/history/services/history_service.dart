import 'package:essemu/app/provider/endpoint.dart';

import '../../../data/history.dart';

class HistoryService {
  Endpoint endpoint = Endpoint();
  Future<List<History>> getData(int id) async {
    try {
      final response = await endpoint.getHistory(id);
      final List<History> history = [];
      for (var data in response) {
        final hist = History.fromJson(data);
        history.add(hist);
      }
      return history;
    } catch (e) {
      throw "$e";
    }
  }
}
