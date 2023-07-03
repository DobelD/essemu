import 'package:essemu/app/modules/detail_menu/service/add_to_cart.dart';
import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/bool_favorite.dart';
import '../../../data/categories.dart';
import '../../../provider/endpoint.dart';
import '../../../themes/colors/colors.dart';
import '../../../themes/decoration/app_padding.dart';
import '../../../themes/typograpy/typo.dart';
import '../../home/services/favorite_service.dart';

class DetailMenuController extends GetxController {
  Menu _menu = Get.arguments['data'];
  List<FavoriteBool> isFavorite = [];
  int idUser = Get.arguments['id_user'];
  int counter = 1;
  int price = 0;
  bool favorite = false;

  Endpoint endpoint = Endpoint();

  void chengeFavorite() async {
    final homeC = Get.put(HomeController());
    if (favorite) {
      await endpoint.deleteFavorite(_menu.id ?? 0, idUser);
      favorite = false;
      update();
    } else {
      addFavorite(idUser, _menu.id ?? 0);
      favorite = true;
      update();
    }
    getFavorite(idUser);
    homeC.getMenu(homeC.idSelected);
    update();
  }

  void incrementCounter(int value) {
    counter++;
    price += value;
    update();
  }

  void decrementCounter(int value) {
    if (counter > 1) {
      counter--;
      price -= value;
      update();
    }
  }

  void addFavorite(int user, int menu) async {
    FavoriteService().addFavorite(user, menu);
    update();
  }

  getFavorite(int id) async {
    final service = FavoriteService();
    isFavorite = await service.getData(id);
    update();
  }

  addCart(int userId, int menuId, int countPrice) async {
    List<dynamic> cartItems = await endpoint.checkCart(userId);

    bool isMenuExist = false;
    for (var item in cartItems) {
      if (item['menu_id'] == menuId) {
        final service = AddToCart();
        await service.incrementItem(userId, menuId, item['qty'], counter);
        isMenuExist = true;
        break;
      }
    }

    if (!isMenuExist) {
      // Menu belum ada dalam keranjang, tambahkan menu baru
      await endpoint.addToCart(menuPayload(menuId, countPrice));
    }
    Get.showSnackbar(GetSnackBar(
      borderRadius: 8.r,
      backgroundColor: kSuccess1,
      duration: 2.seconds,
      margin: DefaultPadding.all,
      snackPosition: SnackPosition.TOP,
      messageText: Text('Success add item to cart',
          style: AppTextTheme.current.bodyTextWhite),
    ));
  }

  Map<String, dynamic> menuPayload(int menuId, int countPrice) {
    Map<String, dynamic> temp = <String, dynamic>{};
    temp['user_id'] = idUser;
    temp['menu_id'] = menuId;
    temp['qty'] = counter;
    temp['count_price'] = countPrice;

    return temp;
  }

  @override
  void onInit() {
    price = _menu.price!;
    favorite = Get.arguments['favorite'];
    super.onInit();
  }

  @override
  void onClose() {
    counter = 1;
    price = _menu.price!;
    super.onClose();
  }
}
