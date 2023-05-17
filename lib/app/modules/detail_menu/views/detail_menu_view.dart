import 'package:essemu/app/modules/detail_menu/views/section/hero_section.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/categories.dart';
import '../controllers/detail_menu_controller.dart';
import 'section/body_section.dart';

class DetailMenuView extends GetView<DetailMenuController> {
  const DetailMenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Menu menu = Get.arguments;
    return Scaffold(
        body: CustomScrollView(
      slivers: [HeroSection(data: menu), BodySection(data: menu)],
    ));
  }
}
