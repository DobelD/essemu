import 'package:essemu/app/modules/detail_menu/views/section/hero_section.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/categories.dart';
import '../controllers/detail_menu_controller.dart';
import 'section/appbar_section.dart';
import 'section/body_section.dart';
import 'section/footer_section.dart';

class DetailMenuView extends GetView<DetailMenuController> {
  const DetailMenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Menu menu = Get.arguments['data'];
    bool favorite = Get.arguments['favorite'];
    return Scaffold(
      backgroundColor: kMainBackground,
      body: CustomScrollView(
        slivers: [
          AppBarSection(
            data: menu,
            fav: favorite,
          ),
          HeroSection(data: menu),
          BodySection(data: menu, fav: favorite)
        ],
      ),
      bottomSheet: FooterSection(data: menu),
    );
  }
}
