import 'dart:async';

import 'package:essemu/app/modules/home/views/section/search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/connection/no_internet.dart';
import '../../../components/spacer/sliver_spacer.dart';
import '../controllers/home_controller.dart';
import 'section/category.dart';
import 'section/heading.dart';
import 'section/location.dart';
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
                c.loading = true;
                c.getFavorite(c.idUser);
                c.getCategory();
                c.getMenu(c.idSelected);
                c.getImage();
                c.stopLoading();
                c.checkConnection();
                // await c.checkLocationPermission().then((val) async {
                //   if (val == true) {
                //     await c.getKordinat();
                //   } else {
                //     c.requestPermission();
                //     await c.getKordinat();
                //   }
                // });
              });
            },
            child: c.isOnline
                ? CustomScrollView(
                    slivers: [
                      HeadingSection(),
                      SliverSpacerV(hight: 18),
                      LocationSection(),
                      SliverSpacerV(hight: 18),
                      SearchSection(),
                      SliverSpacerP(),
                      CategorySection(),
                      MenuSection(),
                      // FooterSection()
                    ],
                  )
                : Offline()),
      );
    });
  }
}
