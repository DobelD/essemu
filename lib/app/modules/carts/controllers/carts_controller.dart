import 'package:essemu/app/data/cart_order.dart';
import 'package:essemu/app/data/order.dart';
import 'package:essemu/app/data/user.dart';
import 'package:essemu/app/modules/carts/services/delete_item_service.dart';
import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/menu_payload.dart';
import '../../../provider/endpoint.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/session/session_manager.dart';
import '../../home/services/foreground_sevice.dart';
import '../services/cart_service.dart';
import '../services/order_service.dart';
import '../services/update_count_service.dart';
import '../services/users_services.dart';

class CartsController extends GetxController {
  final ctrlHome = Get.put(HomeController());
  String publicUrlImages =
      'https://yccxlnodtgrnbcfdjqcg.supabase.co/storage/v1/object/public/orderfood/';

  int counter = 1;
  int price = 0;
  int countCart = 1;
  int idUser = 0;
  bool addNew = false;
  // int subTotal = 0;
  bool isLoading = false;
  bool isCartEmpty = true;
  int subTotal = 0;
  int deliveryFee = 0;
  int restaurantId = 0;

  List<CartOrder> _cartOrder = [];
  List<CartOrder> get cartOrder => _cartOrder;
  List<Order> _order = [];
  List<Order> get order => _order;
  List<int> listQty = [];
  List<int> listMenu = [];
  List<int> durations = [];

  double avgDuration = 0.0;
  Endpoint endpoint = Endpoint();
  User user = User();

  setData(List<CartOrder> data) {
    _cartOrder = data;
    if (data.isNotEmpty) {
      deliveryFee = _cartOrder[0].menu.restaurant?.deliveryFee ?? 0;
      var uniqueMenuIds = <int>{};
      var uniqueCartOrder = <CartOrder>{};

      for (var item in _cartOrder) {
        uniqueMenuIds.add(item.menuId);
        uniqueCartOrder.add(item);
      }

      listMenu = uniqueMenuIds.toList();
      _cartOrder = uniqueCartOrder.toList();
      listQty = _cartOrder.map((item) => item.qty).toList();
      durations = _cartOrder.map((item) => item.menu.duration!).toList();

      int sumDuration = 0;
      for (int i = 0; i < durations.length; i++) {
        sumDuration += durations[i];
      }
      avgDuration = sumDuration / listQty.length;
      restaurantId = _cartOrder[0].menu.restaurant?.id ?? 0;
      isCartEmpty = false;
      update();
    }
    isLoading = false;
    update();
  }

  setOrder(List<Order> data) {
    _order = data;
    update();
  }

  getData(int id) async {
    isLoading = true;
    update();
    final service = CartService();
    final data = await service.getData(id);
    setData(data);
  }

  getOrder(int id) async {
    final order = OrderService();
    final data = await order.getData(id);
    setOrder(data);
  }

  deleteData(int id, int menuId) async {
    final item = DeleteItemCart();
    final service = CartService();
    await item.deleteItem(id, menuId);
    final data = await service.getData(id);
    setData(data);
    Get.showSnackbar(GetSnackBar(
      borderRadius: 8.r,
      backgroundColor: kRed,
      duration: 2.seconds,
      margin: DefaultPadding.all,
      snackPosition: SnackPosition.TOP,
      messageText: Text('Success delete item',
          style: AppTextTheme.current.bodyTextWhite),
    ));
  }

  counterItemIncerement(int id, int menuId, int count) async {
    final updateItem = UpdateItemCart();
    final service = CartService();
    await updateItem.incrementItem(id, menuId, count);
    final data = await service.getData(id);
    setData(data);
  }

  counterItemDecrement(int id, int menuId, int count) async {
    final updateItem = UpdateItemCart();
    final service = CartService();
    if (count > 1) {
      await updateItem.decrementItem(id, menuId, count);
      final data = await service.getData(id);
      setData(data);
    }
  }

  checkout(int id, int totalPrice, int deliveryFee) async {
    List<MenuPayload> mappedList = List<MenuPayload>.generate(listMenu.length,
        (index) => MenuPayload(id: listMenu[index], qty: listQty[index]));
    Get.back();
    isLoading = true;
    update();
    await endpoint.createOrder(orderPayload(
        id,
        totalPrice,
        restaurantId,
        deliveryFee,
        user.address ?? '',
        double.parse(avgDuration.toStringAsFixed(1))));
    final order = OrderService();
    final data = await order.getData(id);
    setOrder(data);
    int orderId = _order.first.id;
    List<Map<String, dynamic>> payloads = [];
    for (var item in mappedList) {
      payloads.add(checkoutPayload(orderId, item.id!, item.qty!));
    }
    await endpoint.checkout(payloads);
    await endpoint.deleteCart(id);
    StreamService.init();
    isLoading = false;
    update();
    Get.offNamedUntil(Routes.MAIN_PAGES, (route) => route.isFirst);
  }

  Map<String, dynamic> orderPayload(int id, int price, int restId,
      int deliveryFee, String address, double avgDuration) {
    Map<String, dynamic> temp = <String, dynamic>{};
    temp['user_id'] = id;
    temp['order_date'] = DateTime.now().millisecondsSinceEpoch;
    temp['total_price'] = price;
    temp['status'] = 'terima';
    temp['restaurant_id'] = restId;
    temp['delivery_fee'] = deliveryFee;
    temp['address'] = address;
    temp['avg_duration'] = avgDuration;
    temp['courier_id'] = 0;
    return temp;
  }

  Map<String, dynamic> checkoutPayload(int id, int menuId, int qty) {
    Map<String, dynamic> temp = <String, dynamic>{};
    temp['order_id'] = id;
    temp['menu_id'] = menuId;
    temp['quantity'] = qty;
    return temp;
  }

  getUsers() async {
    String email = await session.getEmail();
    final service = UserService();
    user = await service.getData(email);
    update();
  }

  @override
  void onInit() {
    getData(ctrlHome.idUser);
    getUsers();
    super.onInit();
  }
}
