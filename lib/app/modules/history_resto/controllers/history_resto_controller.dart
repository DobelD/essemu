import 'package:get/get.dart';

import '../../../data/history_resto.dart';
import '../services/history_service.dart';

class HistoryRestoController extends GetxController {
  List<HistoryRest> _history = [];
  List<HistoryRest> get history => _history;

  setData(List<HistoryRest> data) {
    _history = data;
    update();
  }

  getData() async {
    final service = HistoryService();
    final data = await service.getData(1);
    setData(data);
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
