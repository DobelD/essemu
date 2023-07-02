import 'package:essemu/app/modules/menu_admin/controllers/menu_admin_controller.dart';
import 'package:essemu/app/routes/app_pages.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:essemu/app/utils/extension/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../data/categories.dart';

class ItemMenu extends StatelessWidget {
  const ItemMenu({super.key, required this.menu});

  final Menu menu;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MenuAdminController());
    return Padding(
      padding: EdgeInsets.only(bottom: 12.w),
      child: Container(
          height: 32.w,
          width: MediaQuery.of(context).size.width,
          // padding: DefaultPadding.all,
          child: Row(
            children: [
              Expanded(
                  flex: 6,
                  child: Text('${menu.name}',
                      overflow: TextOverflow.ellipsis,
                      style: AppTextTheme.current.highlightsBody)),
              Expanded(
                  flex: 3,
                  child: Text('${menu.price?.toCurrencyFormat()}',
                      overflow: TextOverflow.ellipsis,
                      style: AppTextTheme.current.highlightsBody)),
              Expanded(
                  flex: 2,
                  child: GestureDetector(
                      onTap: () =>
                          Get.toNamed(Routes.EDIT_MENU, arguments: menu),
                      child: Icon(
                        IconlyBold.edit,
                        color: kBlack,
                      ))),
              Expanded(
                  flex: 2,
                  child: GestureDetector(
                      onTap: () => controller.deleteMenu(
                          menu.id ?? 0, menu.categories?.id ?? 0),
                      child: Icon(
                        IconlyBold.delete,
                        color: kWarning1,
                      ))),
            ],
          )),
    );
  }
}
