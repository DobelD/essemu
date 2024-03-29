import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/bool_favorite.dart';
import '../../../data/categories.dart';
import '../../../provider/endpoint.dart';
import '../../home/controllers/home_controller.dart';
import '../services/favorite_service.dart';
import '../services/menu_service.dart';

class MenuBycategoryController extends GetxController {
  bool isLoadMenu = false;
  bool favorite = false;
  bool loading = true;
  TextEditingController searchC = TextEditingController();
  String pubicUrlCategory =
      'https://yccxlnodtgrnbcfdjqcg.supabase.co/storage/v1/object/public/category/';
  String publicUrlImages =
      'https://yccxlnodtgrnbcfdjqcg.supabase.co/storage/v1/object/public/orderfood/';

  List<FavoriteBool> isFavorite = [];
  List<Menu> _menu = [];
  List<Menu> _searchMenu = [];
  List<Menu> get menu => _searchMenu;

  setMenu(List<Menu> mn) {
    _menu = mn;
    _searchMenu = mn;
    update();
  }

  getMenu(int id, int idUser) async {
    getFavorite(idUser);
    final api = MenuService();
    final mn = await api.getDataById(id);
    setMenu(mn);
  }

  getFavorite(int id) async {
    final service = FavoriteService();
    isFavorite = await service.getData(id);
    update();
  }

  void addFavorite(int user, int menu) async {
    FavoriteService().addFavorite(user, menu);
    update();
  }

  void searchMenu(String query) {
    _searchMenu = _menu
        .where((menu) => menu.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    update();
  }

  stopLoading() async {
    await Future.delayed(3.seconds, () {
      loading = false;
      update();
    });
  }

  stopLoad() async {
    await Future.delayed(const Duration(seconds: 1), () {
      isLoadMenu = false;
      update();
    });
  }

  Endpoint endpoint = Endpoint();

  void chengeFavorite(int? id, int userId) async {
    final homeC = Get.put(HomeController());
    if (favorite) {
      await endpoint.deleteFavorite(id ?? 0, userId);
      favorite = false;
      update();
    } else {
      addFavorite(userId, id ?? 0);
      favorite = true;
      update();
    }
    getFavorite(userId);
    homeC.getMenu(homeC.idSelected);
    update();
  }

  @override
  void onInit() {
    getMenu(Get.arguments['id'], Get.arguments['id_user']);
    stopLoading();
    super.onInit();
  }
}
