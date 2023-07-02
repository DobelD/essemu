import 'dart:async';

import 'package:essemu/app/modules/home/views/section/search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/spacer/sliver_spacer.dart';
import '../controllers/home_controller.dart';
import 'section/campaign_section.dart';
import 'section/category.dart';
import 'section/heading.dart';

import 'section/menu.dart';
import 'widget/floating_order.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(HomeController());
    return GetBuilder<HomeController>(builder: (c) {
      return Scaffold(
        floatingActionButton: FloatingOrder(),
        body: RefreshIndicator(
            onRefresh: () {
              return Future<void>.delayed(2.seconds, () {
                c.getCampaign();
                c.loading = true;
                c.getFavorite(c.idUser);
                c.getCategory();
                c.getMenu(c.idSelected);
                c.getImage();
                c.stopLoading();
                c.checkConnection();
              });
            },
            child: CustomScrollView(
              slivers: [
                HeadingSection(),
                SliverSpacerV(hight: 16),
                CampaignSection(),
                SliverSpacerV(hight: 8),
                SearchSection(),
                CategorySection(),
                MenuSection(),
                SliverSpacerV(hight: 72),
              ],
            )),
      );
    });
  }
}
