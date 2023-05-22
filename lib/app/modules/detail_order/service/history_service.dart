import 'dart:async';

import '../../../data/history.dart';
import '../../../provider/endpoint.dart';

class HistoryService {
  Endpoint endpoint = Endpoint();

  Future<List<History>> getData(int id) async {
    try {
      final response = await endpoint.getHistoryById(id);
      final List<History> history = [];
      for (var data in response) {
        final his = History.fromJson(data);
        history.add(his);
      }
      return history;
    } catch (e) {
      throw "$e";
    }
  }
}
