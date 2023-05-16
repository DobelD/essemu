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

import '../../../data/categories.dart';
import '../services/haversine_service.dart';

class HomeController extends GetxController {
  StreamSubscription<ConnectivityResult>? subscription;
  TextEditingController searchC = TextEditingController();
  bool isOnline = false;
  bool loading = true;
  List<Categories> _category = [];
  // ignore: unused_field
  List<Menu> _menu = [];
  List<Menu> _searchMenu = [];
  List<Categories> get category => _category;
  List<Menu> get menu => _searchMenu;
  int selected = 99;
  int idSelected = 0;
  bool isLoadMenu = false;
  List<String> _images = [];
  List<String> get images => _images;
  User user = User();
  String alamat = '';
  String jalan = '';
  String kecamatan = '';
  String kota = '';
  String? restaurantCordinate;
  String? lat;
  String? long;
  double? currentLat;
  double? currentLong;
  double? distance;
  double? roundedDistance;

  void selectedCategory(int index, int id) {
    selected = index;
    idSelected = id;
    isLoadMenu = true;
    getMenu(id);
    update();
    stopLoad();
  }

  setDistance() {
    distance = calculateDistance(double.parse(lat ?? ''),
            double.parse(long ?? ''), currentLat ?? 0.0, currentLong ?? 0.0) /
        1000;
    roundedDistance = double.parse(distance?.toStringAsFixed(1) ?? '');
  }

  setCategory(List<Categories> ctg) {
    _category = ctg;
    update();
  }

  setMenu(List<Menu> mn) {
    _menu = mn;
    _searchMenu = mn;
    restaurantCordinate = _menu[0].restaurant?.coordinate ?? '';
    List<String> separatedData = restaurantCordinate!.split(", ");
    lat = separatedData[0];
    long = separatedData[1];
    distance = calculateDistance(double.parse(lat ?? ''),
            double.parse(long ?? ''), currentLat ?? 0.0, currentLong ?? 0.0) /
        1000;
    roundedDistance = double.parse(distance?.toStringAsFixed(1) ?? '');
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
    final api = MenuService();
    if (id == 0) {
      final mn = await api.getData();
      setMenu(mn);
    } else {
      final mn = await api.getDataById(id);
      setMenu(mn);
    }
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
    await Future.delayed(4.seconds, () {
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

  getAllData() {
    getCategory();
    getMenu(idSelected);
    getImage();
    getUsers();
    stopLoading();
  }

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
