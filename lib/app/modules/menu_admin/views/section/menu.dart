import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/menu_admin_controller.dart';
import '../widget/item_menu.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MenuAdminController());
    return GetBuilder<MenuAdminController>(builder: (c) {
      // return SliverToBoxAdapter(
      //   child: Center(
      //     child: Text('data'),
      //   ),
      // );
      return SliverList(
          delegate: SliverChildBuilderDelegate(childCount: c.menu.length,
              (context, index) {
        print("lenght :${c.menu.length}");
        final data = c.menu[index];
        return Padding(
            padding: DefaultPadding.all, child: ItemMenu(data: data));
      }));
      // return SliverToBoxAdapter(
      //     child: Column(
      //         children: List.generate(controller.menu.length, (index) {
      //   final data = controller.menu[index];
      //   return ItemMenu(data: data);
      // })));
    });
  }
}
