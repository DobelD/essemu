import 'package:essemu/app/modules/menu_admin/controllers/menu_admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/categories.dart';
import '../../../../themes/colors/colors.dart';
import '../../../../themes/decoration/app_padding.dart';
import '../../../../themes/typograpy/typo.dart';
import 'item_menu.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({super.key, required this.category, required this.index});

  final Categories category;
  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MenuAdminController());
    return GetBuilder<MenuAdminController>(builder: (c) {
      return Padding(
        padding: EdgeInsets.only(bottom: 12.w),
        child: Material(
          color: Colors.transparent,
          child: Container(
            color: kWhite,
            padding: DefaultPadding.side,
            child: ExpansionTile(
              key: Key(index.toString()),
              iconColor: kBlack,
              collapsedIconColor: kBlack,
              collapsedBackgroundColor: kWhite,
              tilePadding: EdgeInsets.zero,
              initiallyExpanded: false,
              maintainState: false,
              onExpansionChanged: (value) {
                controller.setExpanded(index);
                controller.getMenu(category.id ?? 0);
              },
              collapsedShape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent)),
              title:
                  Text('${category.name}', style: AppTextTheme.current.filter),
              children: [
                controller.isLoading
                    ? SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                            child: CircularProgressIndicator(color: kPrimary1)))
                    : Column(
                        children:
                            List.generate(controller.menu.length, (index) {
                        Menu menu = controller.menu[index];
                        return ItemMenu(menu: menu);
                      })),
              ],
            ),
          ),
        ),
      );
    });
  }
}
