import 'package:get/get.dart';

import '../../../data/history_item.dart';
import '../../../data/history_resto.dart';
import '../services/history_service.dart';

class HistoryRestoController extends GetxController {
  List<HistoryRest> _history = [];
  List<HistoryRest> get history => _history;
  List<HistoryItem> _historyItem = [];
  List<HistoryItem> get historyItem => _historyItem;
  bool isLoading = false;

  setData(List<HistoryRest> data) {
    _history = data;
    update();
  }

  setItem(List<HistoryItem> data) {
    _historyItem = data;
    update();
  }

  getData() async {
    final service = HistoryService();
    final data = await service.getData(1);
    setData(data);
  }

  getItem(int id) async {
    final service = HistoryService();
    final data = await service.getDatas(id);
    setItem(data);
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
