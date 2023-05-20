import 'package:essemu/app/data/cart_order.dart';
import 'package:essemu/app/modules/cart/services/delete_item_service.dart';
import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../provider/endpoint.dart';
import '../services/cart_service.dart';
import '../services/update_count_service.dart';

class CartController extends GetxController {
  final ctrlHome = Get.put(HomeController());

  int counter = 1;
  int price = 0;
  int countCart = 1;
  int idUser = 0;
  bool addNew = false;
  // int subTotal = 0;
  bool isLoading = false;
  int subTotal = 0;

  List<CartOrder> _cartOrder = [];
  List<CartOrder> get cartOrder => _cartOrder;
  Endpoint endpoint = Endpoint();

  setData(List<CartOrder> data) {
    _cartOrder = data;
    isLoading = false;
    update();
  }

  getData(int id) async {
    isLoading = true;
    update();
    final service = CartService();
    final data = await service.getData(id);
    setData(data);
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

  checkout(int id, List<int> menuIds, int totalPrice, int restId) async {
    // List<Map<String, dynamic>> payloads = [];
    // for (int menuId in menuIds) {
    //   payloads.add(checkoutPayload(id, menuId));
    // }
    final response =
        await endpoint.createOrder(orderPayload(id, totalPrice, restId));
    final orderId = response[0]['id'];
    print(orderId);
    // await endpoint.checkout(payloads);
    // await endpoint.deleteCart(id);
    // Get.back();
    // ctrlHome.onOrderCreate();
    // Get.toNamed(Routes.MAIN_PAGES);
  }

  Map<String, dynamic> orderPayload(int id, int price, int restId) {
    Map<String, dynamic> temp = <String, dynamic>{};
    temp['user_id'] = id;
    temp['total_price'] = price;
    temp['status'] = 'proses';
    temp['restaurant_id'] = restId;
    return temp;
  }

  Map<String, dynamic> checkoutPayload(int id, int menuId) {
    Map<String, dynamic> temp = <String, dynamic>{};
    temp['order_id'] = id;
    temp['menu_id'] = menuId;
    temp['quantity'] = counter;
    return temp;
  }

  @override
  void onInit() {
    getData(ctrlHome.idUser);
    super.onInit();
  }

  @override
  void onClose() {
    _cartOrder.clear();
    super.onClose();
  }
}
