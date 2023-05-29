import 'package:essemu/app/modules/order_proccess/controllers/order_proccess_controller.dart';
import 'package:get/get.dart';

import '../../../data/item_order.dart';
import '../services/item_service.dart';
import '../services/update_status.dart';

class ComfirmOrderController extends GetxController {
  final ctrl = Get.put(OrderProccessController());
  bool isLoading = false;
  List<ItemOrder> _items = [];
  List<ItemOrder> get items => _items;

  setItem(List<ItemOrder> data) {
    _items = data;
    update();
  }

  getItems(int id) async {
    final service = ItemService();
    final data = await service.getData(id);
    print(data);
    print(id);
    setItem(data);
  }

  sendNotes() {}

  updateStatusSend(int id) async {
    final service = UpdateStatusOrder();
    await service.proccess(id);
  }

  void toSend(int id) {
    isLoading = true;
    update();
    updateStatusSend(id);
    Future.delayed(1.seconds, () {
      isLoading = false;
      update();
      ctrl.sortingData.clear();
      ctrl.getOrder();
      Get.back();
    });
  }

  @override
  void onInit() {
    getItems(Get.arguments['id']);
    super.onInit();
  }

  @override
  void onClose() {
    // Get.arguments['id'] == null;
    super.onClose();
  }
}
