import 'package:get/get.dart';

import '../controllers/history_resto_controller.dart';

class HistoryRestoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryRestoController>(
      () => HistoryRestoController(),
    );
  }
}
