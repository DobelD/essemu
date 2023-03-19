import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/categories.dart';
import 'section/header.dart';
import 'section/menu.dart';

class MenuView extends GetView<MenuController> {
  const MenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Categories ctg = Get.arguments;
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () async {},
      child: CustomScrollView(
        slivers: [HeaderSection(ctg: ctg), MenuSection()],
      ),
    ));
  }
}
