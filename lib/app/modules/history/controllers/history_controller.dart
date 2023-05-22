import 'package:get/get.dart';

import '../../../data/history.dart';
import '../../../utils/session/session_manager.dart';
import '../services/history_service.dart';

class HistoryController extends GetxController {
  List<History> _history = [];
  List<History> get history => _history;
  int idUser = 0;

  setData(List<History> data) {
    _history = data;
    update();
  }

  getData() async {
    final user = await session.getUser();
    final service = HistoryService();
    final data = await service.getData(user!.id!);
    setData(data);
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
