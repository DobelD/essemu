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
  late TextEditingController namaC;
  late TextEditingController deskC;
  late TextEditingController hargaC;
  late TextEditingController kategoriC;
  String publicUrlImages =
      'https://yccxlnodtgrnbcfdjqcg.supabase.co/storage/v1/object/public/orderfood/';
  Menu dataMenu = Menu();

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
  }

  Future getImageMenu() async {
    Get.back();
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
    Get.back();

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
        selectCtg!.isNotEmpty) {
      if (Get.arguments['action'] != 'edit') {
        await endpoint.addMenu(menuPayload());
        await endpoint.addImagesMenu('${namaC.text}', menu!.path);
        namaC.clear();
        deskC.clear();
        hargaC.clear();
        selectCtg = null;
        menu?.delete();
      } else {
        await endpoint.editMenu(menuPayload(), dataMenu.id ?? 0);
        if (menu != null) {
          await endpoint.editImagesMenu('${namaC.text}', menu!.path);
        }
      }

      isLoading = false;
      update();
      Get.showSnackbar(appSnackBarSuccess(Get.arguments['action'] == 'edit'
          ? 'Berhasil edit menu'
          : 'Berhasil menambahkan menu'));
    } else {
      isLoading = false;
      update();
    }
  }

  // Payload

  Map<String, dynamic> menuPayload() {
    Map<String, dynamic> temp = <String, dynamic>{};
    temp['name'] = namaC.text;
    temp['description'] = deskC.text;
    temp['price'] = hargaC.text;
    temp['image_url'] = menu?.path ?? '-';
    temp['category_id'] = categoryId;
    temp['restaurant_id'] = 1;
    return temp;
  }

  void addEditor() {
    if (Get.arguments['action'] == 'edit') {
      dataMenu = Get.arguments['menu'];
      selectCtg = dataMenu.categories?.name;
      categoryId = dataMenu.categories?.id ?? 0;
      changeCategory(
          '{id: ${dataMenu.categories?.id}, name: ${dataMenu.categories?.name}}');
      namaC = TextEditingController(text: dataMenu.name);
      deskC = TextEditingController(text: dataMenu.description);
      hargaC = TextEditingController(text: '${dataMenu.price ?? 0}');
      kategoriC = TextEditingController(text: dataMenu.categories?.name);
    } else {
      namaC = TextEditingController(text: '');
      deskC = TextEditingController(text: '');
      hargaC = TextEditingController(text: '');
      kategoriC = TextEditingController(text: '');
    }
  }

  // OnInit

  @override
  void onInit() {
    addEditor();
    getCategory();

    super.onInit();
  }
}
