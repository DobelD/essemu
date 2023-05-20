import 'package:essemu/app/data/cart_order.dart';
import 'package:essemu/app/modules/cart/services/delete_item_service.dart';
import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/session/session_manager.dart';
import '../services/cart_service.dart';
import '../services/update_count_service.dart';

class CartController extends GetxController {
  final ctrlHome = Get.put(HomeController());

  int counter = 1;
  int price = 0;
  int countCart = 1;
  int idUser = 0;
  bool addNew = false;
  int subTotal = 0;
  bool isLoading = false;

  List<CartOrder> _cartOrder = [];
  List<CartOrder> get cartOrder => _cartOrder;

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

  void incrementCounter(int count, int value, int menuId) {
    UpdateItemCart updateItem = UpdateItemCart();
    count++;
    price += value;
    updateItem.incrementItem(ctrlHome.idUser, menuId, count);
    print(price);
    update();
  }

  void decrementCounter(int count, int value, int menuId) {
    UpdateItemCart updateItem = UpdateItemCart();
    if (count > 1) {
      count--;
      price -= value;
      updateItem.incrementItem(ctrlHome.idUser, menuId, count);
      print(price);
      update();
    }
  }

  getIdUser() async {
    final user = await session.getUser();
    idUser = user!.id!;
  }

  addNewWidget() {
    addNew = true;
    update();
  }

  removeAdd() {
    addNew = false;
    update();
  }

  @override
  void onInit() {
    getIdUser();
    getData(ctrlHome.idUser);
    super.onInit();
  }

  @override
  void onClose() {
    _cartOrder.clear();
    super.onClose();
  }
}
