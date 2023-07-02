import 'package:essemu/app/modules/menu/controllers/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/item_menu.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuControllers>(builder: (c) {
      return SliverToBoxAdapter(
          child: SizedBox(
              height: 600,
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: c.menu.length,
                      itemBuilder: (_, index) {
                        final data = c.menu[index];
                        return ItemMenu(data: data);
                      }))));
      // return SliverList(
      //     delegate: SliverChildBuilderDelegate(childCount: c.menu.length,
      //         (context, index) {
      //   print("lenght :${c.menu.length}");
      //   final data = c.menu[index];
      //   return Padding(
      //       padding: DefaultPadding.all, child: ItemMenu(data: data));
      // }));
      // return SliverToBoxAdapter(
      //     child: Column(
      //         children: List.generate(controller.menu.length, (index) {
      //   final data = controller.menu[index];
      //   return ItemMenu(data: data);
      // })));
    });
  }
}
