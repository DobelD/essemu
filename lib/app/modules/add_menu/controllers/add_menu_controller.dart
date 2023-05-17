import 'dart:io';

import 'package:essemu/app/components/snacbar/app_snackbar.dart';
import 'package:essemu/app/provider/endpoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/categories.dart';
import '../services/category_api.dart';

class AddMenuController extends GetxController {
  // Editing Controller
  TextEditingController namaC = TextEditingController();
  TextEditingController deskC = TextEditingController();
  TextEditingController hargaC = TextEditingController();
  TextEditingController kategoriC = TextEditingController();

  // Endpoint Url
  Endpoint endpoint = Endpoint();

  // Variabel
  bool isLoading = false;
  List<Categories> _category = [];
  List<Categories> get category => _category;
  Categories? selectCategory;
  List<Map<String, dynamic>> listCategory = [];
  String? selectCtg;
  var imagesMenu;
  File? menu;
  final fileName = 'myimage.jpg';
  final filePath = '/path/to/my/image.jpg';

  setCategory(List<Categories> ctg) {
    _category = ctg;
    for (int i = 0; i < _category.length; i++) {
      listCategory.add({'id': _category[i].id, 'name': _category[i].name});
    }
    update();
  }

  getCategory() async {
    final api = CategoryApi();
    final ctg = await api.getCategory();
    setCategory(ctg);
    print(category);
  }

  void changeCategory(String ctg) {
    selectCtg = ctg;
    changeId(ctg);
    update();
  }

  int categoryId = 0;

  changeId(String sctg) {
    List<String> parts = sctg.split(': ');
    List<String> idPart = parts[1].split(',');
    categoryId = int.parse(idPart[0]);
    print(categoryId);
  }

  Future getImageMenu() async {
    final sharedPref = await SharedPreferences.getInstance();
    final ImagePicker picker1 = ImagePicker();
    final imagePicked1 =
        await picker1.pickImage(source: ImageSource.camera, imageQuality: 30);

    imagesMenu = imagePicked1!.path;
    await sharedPref.setString('menu_url', imagesMenu);
    menu = File(imagePicked1.path);
    update();
  }

  Future getImageGalery() async {
    final sharedPref = await SharedPreferences.getInstance();
    final ImagePicker picker1 = ImagePicker();
    final imagePicked1 =
        await picker1.pickImage(source: ImageSource.gallery, imageQuality: 30);

    imagesMenu = imagePicked1!.path;
    await sharedPref.setString('menu_url', imagesMenu);
    menu = File(imagePicked1.path);
    update();
  }

  addMenu() async {
    isLoading = true;
    update();
    if (namaC.text.isNotEmpty &&
        deskC.text.isNotEmpty &&
        hargaC.text.isNotEmpty &&
        selectCtg!.isNotEmpty &&
        menu!.path.isNotEmpty) {
      await endpoint.addMenu(menuPayload());
      await endpoint.addImagesMenu('${namaC.text}.jpg', menu!.path);
      namaC.clear();
      deskC.clear();
      hargaC.clear();
      selectCtg = null;
      menu?.delete();
      isLoading = false;
      update();
      Get.showSnackbar(appSnackBarSuccess('Berhasil menambahkan menu'));
    } else {
      isLoading = false;
      update();
      print('Gagal');
    }
  }

  // Payload

  Map<String, dynamic> menuPayload() {
    Map<String, dynamic> temp = <String, dynamic>{};
    temp['name'] = namaC.text;
    temp['description'] = deskC.text;
    temp['price'] = hargaC.text;
    temp['image_url'] = menu!.path;
    temp['category_id'] = categoryId;
    temp['restaurant_id'] = 1;
    temp['favorit'] = false;
    return temp;
  }

  // OnInit

  @override
  void onInit() {
    getCategory();
    super.onInit();
  }
}
