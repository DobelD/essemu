import 'package:essemu/app/provider/endpoint.dart';

import '../../../data/history.dart';
import '../../../data/history_item.dart';

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
