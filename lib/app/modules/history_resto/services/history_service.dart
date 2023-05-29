import 'package:essemu/app/provider/endpoint.dart';

import '../../../data/history_resto.dart';

class HistoryService {
  Endpoint endpoint = Endpoint();
  Future<List<HistoryRest>> getData(int id) async {
    try {
      final response = await endpoint.getHistoryRest(id);
      final List<HistoryRest> history = [];
      for (var data in response) {
        final hist = HistoryRest.fromJson(data);
        history.add(hist);
      }
      return history;
    } catch (e) {
      throw "$e";
    }
  }
}
