import 'package:essemu/app/components/no_data/no_data_menu.dart';
import 'package:essemu/app/modules/menu_bycategory/controllers/menu_bycategory_controller.dart';
import 'package:essemu/app/routes/app_pages.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:essemu/app/utils/extension/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../provider/endpoint.dart';
import '../../../../themes/decoration/app_radius.dart';
import '../../../home/views/widget/shimmer/menu.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key, required this.idUser, required this.distance});

  final int idUser;
  final double distance;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(MenuBycategoryController());
    return SliverToBoxAdapter(
        child: GetBuilder<MenuBycategoryController>(builder: (c) {
      return c.loading
          ? MenuLoading()
          : c.isLoadMenu
              ? MenuLoading()
              : Column(
                  children: [
                    c.menu.isNotEmpty
                        ? SizedBox(
                            child: GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: c.menu.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.79,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12),
                            itemBuilder: (context, index) {
                              final menu = c.menu[index];
                              bool isMatch = c.isFavorite.any(
                                  (favorite) => favorite.menuId == menu.id);
                              return GestureDetector(
                                onTap: () => Get.toNamed(Routes.DETAIL_MENU,
                                    arguments: {
                                      "data": menu,
                                      "favorite": isMatch,
                                      "id_user": idUser
                                    }),
                                child: Container(
                                  height: 200.w,
                                  width: 158.w,
                                  decoration: BoxDecoration(
                                    color: kWhite,
                                    borderRadius: AppRadius.all,
                                    border: Border.all(
                                        color: kDividerItemSectionDashboard),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 116.w,
                                        width: 158.w,
                                        padding: MiddlePadding.all,
                                        decoration: BoxDecoration(
                                            color: kSofterGrey,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    '${c.publicUrlImages}${menu.name}'),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8))),
                                      ),
                                      SizedBox(
                                          child: Padding(
                                        padding: MiddlePadding.all,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${distance} Km',
                                              style: AppTextTheme
                                                  .current.highlightsBodyHint,
                                            ),
                                            SizedBox(height: 4.w),
                                            Text(
                                              '${menu.name}',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  AppTextTheme.current.title3,
                                            ),
                                            SizedBox(height: 4.w),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${menu.price!.toCurrencyFormat()}',
                                                  style: AppTextTheme
                                                      .current.title5,
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    Endpoint endpoint =
                                                        Endpoint();
                                                    isMatch
                                                        ? await endpoint
                                                            .deleteFavorite(
                                                                menu.id!,
                                                                idUser)
                                                        : c.addFavorite(
                                                            idUser, menu.id!);
                                                    c.getFavorite(idUser);
                                                  },
                                                  child: Icon(
                                                    isMatch
                                                        ? IconlyBold.heart
                                                        : IconlyLight.heart,
                                                    size: 20,
                                                    color: isMatch
                                                        ? kRed
                                                        : kSoftGrey,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                              );
                            },
                          ))
                        : NoMenu(),
                    SizedBox(height: 16.h),
                  ],
                );
    }));
  }
}
