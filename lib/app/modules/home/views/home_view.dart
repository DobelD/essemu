import 'package:essemu/app/modules/home/views/section/search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/spacer/sliver_spacer.dart';
import '../../../data/categories.dart';
import '../controllers/home_controller.dart';
import 'section/category.dart';
import 'section/footer.dart';
import 'section/heading.dart';
import 'section/location.dart';
import 'section/menu.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return GetBuilder<HomeController>(builder: (c) {
      List<Categories> _category = c.category;
      List<Menu> _menu = c.menu;
      return Scaffold(
          body: RefreshIndicator(
        onRefresh: () async {
          controller.getCategory();
        },
        child: CustomScrollView(
          slivers: [
            SliverSpacerV(hight: 40),
            HeadingSection(isLoading: c.loading),
            SliverSpacerV(hight: 18),
            LocationSection(isLoading: c.loading),
            SliverSpacerV(hight: 18),
            SearchSection(isLoading: c.loading),
            SliverSpacerP(),
            CategorySection(
              isLoading: c.loading,
              category: _category,
              c: c,
            ),
            MenuSection(isLoading: c.loading, menu: _menu),
            FooterSection()
          ],
        ),
      ));
    });
  }
}
