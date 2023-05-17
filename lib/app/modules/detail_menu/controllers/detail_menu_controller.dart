import 'package:get/get.dart';

import '../../../data/bool_favorite.dart';
import '../../../data/categories.dart';
import '../../home/services/favorite_service.dart';

class DetailMenuController extends GetxController {
  Menu _menu = Get.arguments['data'];
  List<FavoriteBool> isFavorite = [];

  int counter = 1;
  int price = 0;

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

  @override
  void onInit() {
    price = _menu.price!;
    super.onInit();
  }

  @override
  void onClose() {
    counter = 1;
    price = _menu.price!;
    super.onClose();
  }
}
