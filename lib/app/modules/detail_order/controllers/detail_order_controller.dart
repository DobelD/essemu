import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:essemu/app/provider/endpoint.dart';
import 'package:essemu/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/history.dart';
import '../../../data/item_order.dart';
import '../../../data/menu_payload.dart';
import '../../../data/order.dart';
import '../service/delete_item_service.dart';
import '../service/history_service.dart';
import '../service/item_order_service.dart';

class DetailOrderController extends GetxController {
  final ctrlHome = Get.put(HomeController());
  Endpoint endpoint = Endpoint();
  int idOrder = 0;
  int totalPrice = 0;

  List<Order> _order = [];
  List<ItemOrder> _itemOrder = [];
  List<ItemOrder> get itemOrder => _itemOrder;
  List<History> _history = [];
  List<int> menu = [];
  List<int> qty = [];
  bool isLoading = false;

  setOrder(List<Order> data) {
    _order = data;
    update();
  }

  setItemOrder(List<ItemOrder> data) {
    _itemOrder = data;
    for (var item in _itemOrder) {
      menu.add(item.menuId);
      qty.add(item.quantity);
    }
    update();
  }

  setHistory(List<History> data) {
    _history = data;
    update();
  }

  getItem(int id) async {
    final service = ItemOrderService();
    final data = await service.getDatas(id);
    setItemOrder(data);
  }

  onOrderSuccess() async {
    isLoading = true;
    update();
    List<MenuPayload> mappedList = List<MenuPayload>.generate(
        menu.length, (index) => MenuPayload(id: menu[index], qty: qty[index]));
    await endpoint.createHistory(historyPayload(ctrlHome.idUser, totalPrice));
    final history = HistoryService();
    final datsHist = await history.getData(ctrlHome.idUser);
    setHistory(datsHist);
    int historyId = datsHist.first.id;
    print(historyId);
    print(mappedList);
    final service = DeleteOrder();
    List<Map<String, dynamic>> payloads = [];
    for (var item in mappedList) {
      payloads.add(itemPayload(historyId, item.id!, item.qty!));
    }
    await service.deleteItem(idOrder);
    await endpoint.createItemHistory(payloads);
    await service.deleteOrder(ctrlHome.idUser);
    isLoading = false;
    update();
    Get.offNamed(Routes.MAIN_PAGES);
  }

  Map<String, dynamic> historyPayload(int id, int price) {
    Map<String, dynamic> temp = <String, dynamic>{};
    temp['user_id'] = id;
    temp['total'] = price;
    temp['status'] = 'selesai';
    return temp;
  }

  Map<String, dynamic> itemPayload(int id, int menuId, int qty) {
    Map<String, dynamic> temp = <String, dynamic>{};
    temp['history_id'] = id;
    temp['menu_id'] = menuId;
    temp['qty'] = qty;
    return temp;
  }

  @override
  void onInit() {
    idOrder = Get.arguments['id_order'];
    totalPrice = Get.arguments['total'];
    getItem(idOrder);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
