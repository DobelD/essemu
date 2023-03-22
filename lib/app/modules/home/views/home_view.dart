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

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return GetBuilder<HomeController>(builder: (c) {
      return Scaffold(
          body: RefreshIndicator(
              onRefresh: () async {
                controller.getCategory();
              },
              child: c.isOnline
                  ? CustomScrollView(
                      slivers: [
                        SliverSpacerV(hight: 40),
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
                  : Offline()));
    });
  }
}
