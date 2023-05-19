import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:essemu/app/data/user.dart';
import 'package:essemu/app/modules/home/services/category_service.dart';
import 'package:essemu/app/modules/home/services/menu_service.dart';
import 'package:essemu/app/modules/home/services/users_services.dart';
import 'package:essemu/app/utils/session/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../data/bool_favorite.dart';
import '../../../data/categories.dart';
import '../../../data/item_order.dart' as i;
import '../services/favorite_service.dart';
import '../services/haversine_service.dart';

class HomeController extends GetxController {
  StreamSubscription<ConnectivityResult>? subscription;
  TextEditingController searchC = TextEditingController();
  String publicUrlImages =
      'https://yccxlnodtgrnbcfdjqcg.supabase.co/storage/v1/object/public/orderfood/';
  String pubicUrlCategory =
      'https://yccxlnodtgrnbcfdjqcg.supabase.co/storage/v1/object/public/category/';
  bool isOnline = false;
  bool loading = true;
  List<Categories> _category = [];
  // ignore: unused_field
  List<Menu> _menu = [];
  List<Menu> _searchMenu = [];
  List<i.ItemOrder> _items = [];
  List<i.ItemOrder> get items => _items;
  List<Categories> get category => _category;
  List<Menu> get menu => _searchMenu;
  int selected = 99;
  int idSelected = 0;
  bool isLoadMenu = false;
  bool matchMenu = false;
  bool onOrder = false;
  List<String> _images = [];
  List<String> get images => _images;
  List<FavoriteBool> isFavorite = [];
  int idUser = 0;
  User user = User();
  String alamat = '';
  String jalan = '';
  String kecamatan = '';
  String kota = '';
  String? restaurantCordinate;
  double? lat;
  double? long;
  double? currentLat;
  double? currentLong;
  double distance = 0.0;
  double roundedDistance = 0.0;

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
    _searchMenu = mn;
    print(lat);
    print(long);
    update();
  }

  setImage(List<String> img) {
    _images = img;
    update();
  }

  getCategory() async {
    final api = CategoryService();
    final ctg = await api.getData();
    setCategory(ctg);
  }

  getUsers() async {
    String email = await session.getEmail();
    final service = UserService();
    user = await service.getData(email);
    update();
    print(user);
  }

  getMenu(int id) async {
    getFavorite(idUser);
    final api = MenuService();
    if (id == 0) {
      final mn = await api.getData();
      setMenu(mn);
    } else {
      final mn = await api.getDataById(id);
      setMenu(mn);
    }
    setDistance(currentLat!, currentLong!);
  }

  getFavorite(int id) async {
    final service = FavoriteService();
    isFavorite = await service.getData(id);
    update();
  }

  getImage() async {
    final api = MenuService();
    final img = await api.getImages();
    setImage(img);
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

  checkConnection() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      isOnline = (result != ConnectivityResult.none);
      update();
    });
  }

  Future<bool> checkLocationPermission() async {
    final status = await Permission.locationWhenInUse.status;
    _permissionStatus = status;
    update();
    if (_permissionStatus == PermissionStatus.denied) {
      return false;
    }
    return true;
  }

  PermissionStatus _permissionStatus = PermissionStatus.denied;
  Future<void> requestPermission() async {
    final result = await Permission.locationWhenInUse.request();
    _permissionStatus = result;
  }

  getKordinat() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    currentLat = position.latitude;
    currentLong = position.longitude;
    setDistance(position.latitude, position.longitude);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    for (final placeMark in placemarks) {
      String kecamatans = placeMark.locality.toString();
      String kotas = placeMark.subAdministrativeArea.toString();
      List<String> splitKecamatan = kecamatans.split(' ');
      List<String> splitKota = kotas.split(' ');
      jalan = placeMark.street.toString();
      kecamatan = splitKecamatan.last;
      kota = splitKota.last;
    }
    var address = "${jalan} - ${kecamatan} - ${kota}";
    alamat = address;
    update();
  }

  setDistance(double currentLat, double currentLong) async {
    restaurantCordinate = await menu.first.restaurant!.coordinate;
    List<String> separatedData = restaurantCordinate?.split(", ") ?? [""];
    if (separatedData.length >= 2) {
      lat = double.tryParse(separatedData[0]);
      long = double.tryParse(separatedData[1]);
      if (lat != null && long != null) {
        distance = calculateDistance(
                lat ?? 0.0, long ?? 0.0, currentLat, currentLong) /
            1000;
        roundedDistance = double.parse(distance.toStringAsFixed(1));
        update();
      } else {
        // Handle the case when any of the values are null or invalid
      }
    } else {
      // Handle the case when separatedData doesn't have enough elements
    }
  }

  void getUserId() async {
    final user = await session.getUser();
    idUser = user!.id!;
    getFavorite(user.id!);
    update();
  }

  void addFavorite(int user, int menu) async {
    FavoriteService().addFavorite(user, menu);
    update();
  }

  onOrderCreate() {
    onOrder = true;
    update();
  }

  onOrderDone() {
    onOrder = false;
    update();
  }

  // bool isMatch(int id) {
  //   bool match = isFavorite.any((favorite) => favorite.menuId == id);
  //   if (match) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  @override
  void onInit() {
    checkLocationPermission().then((val) async {
      if (val == true) {
        await getKordinat();
      } else {
        requestPermission();
        await getKordinat();
      }
    });
    getUserId();
    getCategory();
    getMenu(idSelected);
    getImage();
    getUsers();
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
