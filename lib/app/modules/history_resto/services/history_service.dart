import 'package:essemu/app/provider/endpoint.dart';

import '../../../data/history_item.dart';
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

  Future<List<HistoryItem>> getDatas(int id) async {
    try {
      final response = await endpoint.getHistoryItem(id);
      final List<HistoryItem> history = [];
      for (var data in response) {
        final hist = HistoryItem.fromJson(data);
        history.add(hist);
      }
      return history;
    } catch (e) {
      throw "$e";
    }
  }
}
