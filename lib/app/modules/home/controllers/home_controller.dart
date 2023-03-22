import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:essemu/app/modules/home/services/category_service.dart';
import 'package:essemu/app/modules/home/services/menu_service.dart';
import 'package:get/get.dart';

import '../../../data/categories.dart';

class HomeController extends GetxController {
  StreamSubscription<ConnectivityResult>? subscription;
  bool isOnline = false;
  bool loading = true;
  List<Categories> _category = [];
  List<Menu> _menu = [];
  List<Categories> get category => _category;
  List<Menu> get menu => _menu;
  int selected = 99;
  int idSelected = 0;
  bool isLoadMenu = false;

  void selectedCategory(int index, int id) {
    selected = index;
    idSelected = id;
    isLoadMenu = true;
    getMenu(id);
    update();
    stopLoad();
  }

  setCategory(List<Categories> ctg) {
    _category = ctg;
    update();
  }

  setMenu(List<Menu> mn) {
    _menu = mn;
    update();
  }

  getCategory() async {
    final api = CategoryService();
    final ctg = await api.getData();
    setCategory(ctg);
  }

  getMenu(int id) async {
    final api = MenuService();
    if (id == 0) {
      final mn = await api.getData();
      setMenu(mn);
    } else {
      final mn = await api.getDataById(id);
      setMenu(mn);
    }
  }

  stopLoading() async {
    await Future.delayed(const Duration(seconds: 3), () {
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

  checkConnection() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      isOnline = (result != ConnectivityResult.none);
      update();
    });
  }

  @override
  void onInit() {
    getCategory();
    getMenu(idSelected);
    stopLoading();
    super.onInit();
    checkConnection();
  }

  @override
  void onClose() {
    subscription?.cancel();
    super.onClose();
  }
}
