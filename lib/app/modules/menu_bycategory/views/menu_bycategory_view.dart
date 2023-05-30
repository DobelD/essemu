import 'package:essemu/app/components/spacer/sliver_spacer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/menu_bycategory_controller.dart';
import 'section/appbar_section.dart';
import 'section/menu.dart';
import 'section/search.dart';

class MenuBycategoryView extends GetView<MenuBycategoryController> {
  const MenuBycategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String name = Get.arguments['name'];
    int idUser = Get.arguments['id_user'];
    double distance = Get.arguments['distance'];
    String imageUrl = Get.arguments['image_url'];

    return GetBuilder<MenuBycategoryController>(builder: (context) {
      return Scaffold(
          body: CustomScrollView(
        slivers: [
          AppBarSection(name: name, url: imageUrl),
          SliverSpacerV(hight: 8),
          SearchSection(),
          SliverSpacerV(hight: 12),
          MenuSection(idUser: idUser, distance: distance)
        ],
      ));
    });
  }
}
