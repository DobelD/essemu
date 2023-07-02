import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/categories.dart';
import '../../../themes/colors/colors.dart';
import '../../../themes/decoration/app_padding.dart';
import '../../../themes/typograpy/typo.dart';
import '../service/category_service.dart';
import '../service/menu_service.dart';

class MenuAdminController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  List<Categories> _category = [];
  List<Categories> get category => _category;
  List<Menu> _menu = [];
  List<Menu> get menu => _menu;
  bool isLoading = false;

  int expandedIndex = -1;

  void setExpanded(int index) {
    if (expandedIndex == index) {
      expandedIndex = -1;
      update();
    } else {
      expandedIndex = index;
      update();
    }
  }

  setCategory(List<Categories> data) {
    _category = data;
    update();
  }

  setMenu(List<Menu> data) {
    _menu = data;

    isLoading = false;
    update();
  }

  getCategory() async {
    final api = CategoryService();
    final data = await api.getData();
    await Future.delayed(2.seconds);
    setCategory(data);
  }

  getMenu(int id) async {
    isLoading = true;
    update();
    final api = MenuService();
    final data = await api.getDataById(id);
    setMenu(data);
  }

  void deleteMenu(int id, int idCategory) async {
    final service = MenuService();
    final menue = await service.delete(id);
    if (menue) {
      getMenu(idCategory);
      Get.showSnackbar(GetSnackBar(
        borderRadius: 8.r,
        backgroundColor: kSuccess1,
        duration: 2.seconds,
        margin: DefaultPadding.all,
        snackPosition: SnackPosition.TOP,
        messageText:
            Text('Menu deleted', style: AppTextTheme.current.bodyTextWhite),
      ));
    } else {
      Get.showSnackbar(GetSnackBar(
        borderRadius: 8.r,
        backgroundColor: kWarning1,
        duration: 2.seconds,
        margin: DefaultPadding.all,
        snackPosition: SnackPosition.TOP,
        messageText:
            Text('Menu not deleted', style: AppTextTheme.current.bodyTextWhite),
      ));
    }
  }

  @override
  void onInit() {
    getCategory();
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: animationController);
    animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
  }
}
