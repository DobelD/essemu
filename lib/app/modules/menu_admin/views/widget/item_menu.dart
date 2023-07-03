import 'package:essemu/app/modules/menu_admin/controllers/menu_admin_controller.dart';
import 'package:essemu/app/routes/app_pages.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:essemu/app/utils/extension/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
                      onTap: () => Get.toNamed(Routes.ADD_MENU,
                          arguments: {'menu': menu, 'action': 'edit'}),
                      child: Icon(
                        IconlyBold.edit,
                        color: kBlack,
                      ))),
              Expanded(
                  flex: 2,
                  child: GestureDetector(
                      onTap: () => Get.dialog(Dialog(
                          insetPadding: EdgeInsets.symmetric(
                              vertical: 220.w, horizontal: 16.w),
                          child: Container(
                            height: 120.w,
                            width: Get.width * 0.9,
                            decoration: BoxDecoration(
                                color: kWhite,
                                borderRadius: BorderRadius.circular(8.r)),
                            padding: DefaultPadding.all,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Apakah anda yakin menghapus menu?',
                                  style: AppTextTheme.current.bodyText,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: SizedBox(
                                    width: 140.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                            onPressed: () => Get.back(),
                                            child: Text(
                                              'Tidak',
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.bold,
                                                  color: kBlack),
                                            )),
                                        TextButton(
                                            onPressed: () =>
                                                controller.deleteMenu(
                                                    menu.id ?? 0,
                                                    menu.categories?.id ?? 0,
                                                    menu.name ?? ''),
                                            child: Text(
                                              'Ya',
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.bold,
                                                  color: kWarning1),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ))),
                      child: Icon(
                        IconlyBold.delete,
                        color: kWarning1,
                      ))),
            ],
          )),
    );
  }
}
