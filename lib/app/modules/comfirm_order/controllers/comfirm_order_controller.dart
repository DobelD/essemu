import 'package:essemu/app/modules/order_proccess/controllers/order_proccess_controller.dart';
import 'package:get/get.dart';

import '../../../data/courier.dart';
import '../../../data/item_order.dart';
import '../services/courier_service.dart';
import '../services/item_service.dart';
import '../services/update_status.dart';

class ComfirmOrderController extends GetxController {
  final ctrl = Get.put(OrderProccessController());
  bool isLoading = false;
  List<ItemOrder> _items = [];
  List<ItemOrder> get items => _items;
  List<Courier> _courier = [];
  List<Courier> get courier => _courier;
  Courier? selectCourier;
  List<Map<String, dynamic>> listCourier = [];
  String? selectCr;
  int idResto = 0;
  int courierId = 0;

  setCourier(List<Courier> data) {
    _courier = data;
    for (int i = 0; i < _courier.length; i++) {
      listCourier.add({'id': _courier[i].id, 'name': _courier[i].name});
    }
    update();
  }

  getCaourier(int id) async {
    final service = CourierService();
    final data = await service.getData(id);
    setCourier(data);
  }

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
    await service.proccess(id, courierId);
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

  void changeCourier(String cr) {
    selectCr = cr;
    print(cr);
    changeId(cr);
    update();
  }

  changeId(String sctg) {
    List<String> parts = sctg.split(': ');
    List<String> idPart = parts[1].split(',');
    courierId = int.parse(idPart[0]);
  }

  @override
  void onInit() {
    getItems(Get.arguments['id']);
    idResto = Get.arguments['id_rest'];
    getCaourier(idResto);
    super.onInit();
  }

  @override
  void onClose() {
    // Get.arguments['id'] == null;
    super.onClose();
  }
}
