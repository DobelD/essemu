import 'package:essemu/app/data/item_order.dart';
import 'package:essemu/app/data/user.dart';
import 'package:essemu/app/modules/order_proccess/services/update_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/orders.dart';
import '../../../data/order_rest.dart';
import '../../../themes/colors/colors.dart';
import '../../../themes/decoration/app_padding.dart';
import '../../../themes/typograpy/typo.dart';
import '../../../utils/session/session_manager.dart';
import '../services/order_services.dart';

class OrderProccessController extends GetxController
    with GetTickerProviderStateMixin {
  // StreamSubscription<Postg>? streamSubscription;
  late Stream<List<Order>> orders;
  List<OrderRest> _futureOrder = [];
  List<OrderRest> get futureOrder => _futureOrder;
  List<ItemOrder> _items = [];
  List<ItemOrder> get items => _items;
  bool isLoading = false;
  User user = User();

  setOrder(List<OrderRest> data) {
    _futureOrder = data;
    update();
  }

  setItem(List<ItemOrder> data) {
    _items = data;
    isLoading = false;
    update();
  }

  getOrder() async {
    final service = OrderService();
    final data = await service.getDatad(idUser);
    setOrder(data);
  }

  getItems(int id) async {
    isLoading = true;
    final service = OrderService();
    final data = await service.getData(id);
    setItem(data);
  }

  void sortOrder(String value) {
    if (value == 'priority') {
      _futureOrder.sort((a, b) => a.totalPrice!.compareTo(b.totalPrice!));
      update();
    }
  }

  getUsers(int id) async {
    final service = OrderService();
    user = await service.getDatas(id);
    update();
    print(user);
  }

  late TabController controlTabs;
  int idUser = 0;

  // late Stream<RealtimeChannel> orders;

  getIdUser() async {
    final user = await session.getUser();
    idUser = user!.id!;
  }

  updateStatus(int id) async {
    final service = UpdateStatusOrder();
    await service.proccess(id);
  }

  updateStatusCencel(int id) async {
    final service = UpdateStatusOrder();
    await service.cencel(id);
  }

  updateStatusDone(int id) async {
    final service = UpdateStatusOrder();
    await service.done(id);
    await getOrder();
    Get.back();
    Get.showSnackbar(GetSnackBar(
      borderRadius: 8.r,
      backgroundColor: kSuccess1,
      duration: 2.seconds,
      margin: DefaultPadding.all,
      snackPosition: SnackPosition.TOP,
      messageText:
          Text('Order Completed', style: AppTextTheme.current.bodyTextWhite),
    ));
  }

  void toProccess(int id) async {
    await updateStatus(id);
    await getOrder();
    Get.showSnackbar(GetSnackBar(
      borderRadius: 8.r,
      backgroundColor: kSuccess1,
      duration: 1.seconds,
      margin: DefaultPadding.all,
      snackPosition: SnackPosition.TOP,
      messageText:
          Text('Order proccessed', style: AppTextTheme.current.bodyTextWhite),
    ));
  }

  void toCencel(int id) {
    Get.back();
    updateStatusCencel(id);
  }

  void toDone(int id) {
    Get.back();
    updateStatusDone(id);
  }

  OrderService service = OrderService();

  @override
  void onInit() {
    controlTabs = TabController(length: 3, vsync: this);
    getIdUser();
    orders = service.getDatae(idUser);
    getOrder();
    super.onInit();
  }
}
