import 'package:essemu/app/modules/history/controllers/history_controller.dart';
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
import '../service/order_service.dart';

class DetailOrderController extends GetxController {
  final ctrlHome = Get.put(HomeController());
  final ctrlHist = Get.put(HistoryController());
  Endpoint endpoint = Endpoint();
  int idOrder = 0;
  int idUser = 0;
  int totalPrice = 0;

  late Stream<List<ItemOrder>> items;
  late Stream<Order> orders;

  // ignore: unused_field
  List<Order> _order = [];
  List<ItemOrder> _itemOrder = [];
  List<ItemOrder> get itemOrder => _itemOrder;
  // ignore: unused_field
  List<History> _history = [];
  List<int> menu = [];
  List<int> qty = [];
  bool isLoading = false;
  String status = '';

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
    print(data);
    setItemOrder(data);
  }

  cobas() {
    List<MenuPayload> mappedList = List<MenuPayload>.generate(
        menu.length, (index) => MenuPayload(id: menu[index], qty: qty[index]));
    print(mappedList);
  }

  onOrderSuccess(int restId) async {
    isLoading = true;
    update();
    List<MenuPayload> mappedList = List<MenuPayload>.generate(
        menu.length, (index) => MenuPayload(id: menu[index], qty: qty[index]));
    await endpoint
        .createHistory(historyPayload(ctrlHome.idUser, totalPrice, restId));
    final history = HistoryService();
    final datsHist = await history.getData(ctrlHome.idUser);
    setHistory(datsHist);
    int historyId = datsHist.first.id!;
    print('map::$mappedList');
    print('his:$historyId');
    List<Map<String, dynamic>> payloads = [];
    for (var item in mappedList) {
      payloads.add(itemPayload(historyId, item.id!, item.qty!));
    }
    final service = DeleteOrder();
    print('pat:$payloads');
    await service.deleteItem(idOrder);
    await endpoint.createItemHistory(payloads);
    await service.deleteOrder(ctrlHome.idUser);
    ctrlHist.getData();
    isLoading = false;
    update();
    Get.offNamedUntil(Routes.MAIN_PAGES, (route) => route.isFirst);
  }

  Map<String, dynamic> historyPayload(int id, int price, int restId) {
    Map<String, dynamic> temp = <String, dynamic>{};
    temp['user_id'] = id;
    temp['created_at'] = DateTime.now().millisecondsSinceEpoch;
    temp['total'] = price;
    temp['status'] = 'selesai';
    temp['restaurant_id'] = restId;
    return temp;
  }

  Map<String, dynamic> itemPayload(int id, int menuId, int qty) {
    Map<String, dynamic> temp = <String, dynamic>{};
    temp['history_id'] = id;
    temp['menu_id'] = menuId;
    temp['qty'] = qty;
    return temp;
  }

  ItemOrderService service = ItemOrderService();
  OrderService services = OrderService();
  @override
  void onInit() {
    idUser = Get.arguments['id_user'];
    idOrder = Get.arguments['id_order'];
    totalPrice = Get.arguments['total'];
    items = service.getData(idOrder);
    orders = services.getData(idUser);
    getItem(idOrder);
    super.onInit();
  }

  setStatus(String? value) {
    status = value ?? '';
  }

  @override
  void onClose() {
    super.onClose();
  }
}
