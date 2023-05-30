import 'package:get/get.dart';

import '../../../data/history.dart';
import '../../../data/history_item.dart';
import '../../../utils/session/session_manager.dart';
import '../services/history_service.dart';

class HistoryController extends GetxController {
  List<History> _history = [];
  List<History> get history => _history;
  List<HistoryItem> _historyItem = [];
  List<HistoryItem> get historyItem => _historyItem;
  int idUser = 0;
  bool isLoading = false;

  setData(List<History> data) {
    _history = data;
    update();
  }

  setItem(List<HistoryItem> data) {
    _historyItem = data;
    update();
  }

  getData() async {
    final user = await session.getUser();
    final service = HistoryService();
    final data = await service.getData(user!.id!);
    setData(data);
  }

  getItem(int id) async {
    final service = HistoryService();
    final data = await service.getDatas(id);
    setItem(data);
  }

  getIdUser() async {
    final user = await session.getUser();
    idUser = user!.id!;
  }

  @override
  void onInit() {
    getIdUser();
    getData();
    super.onInit();
  }
}
