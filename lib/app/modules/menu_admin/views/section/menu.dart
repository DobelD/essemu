import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/categories.dart';
import '../../../../themes/decoration/app_padding.dart';
import '../../controllers/menu_admin_controller.dart';
import '../widget/item_category.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(MenuAdminController());
    return GetBuilder<MenuAdminController>(builder: (c) {
      return SliverPadding(
        padding: DefaultPadding.all,
        sliver: SliverList(
            delegate: SliverChildBuilderDelegate(childCount: c.category.length,
                (_, index) {
          Categories data = c.category[index];
          return ItemCategory(category: data, index: index);
        })),
      );
    });
  }
}
