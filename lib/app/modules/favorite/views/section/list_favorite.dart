import 'package:essemu/app/data/favorite.dart';
import 'package:essemu/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:essemu/app/modules/favorite/services/get_favorite.dart';
import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:essemu/app/provider/endpoint.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../routes/app_pages.dart';
import '../../../../themes/colors/colors.dart';
import '../../../../themes/decoration/app_radius.dart';
import '../../../../themes/typograpy/typo.dart';

class ListFavorite extends StatelessWidget {
  const ListFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());
    final ctrlHome = Get.put(HomeController());
    FavoriteService sevice = FavoriteService();

    return GetBuilder<FavoriteController>(builder: (c) {
      return SliverPadding(
        padding: DefaultPadding.up,
        sliver: SliverToBoxAdapter(
          child: StreamBuilder<List<Favorite>>(
              stream: sevice.getData(controller.idUser),
              builder: (context, snap) {
                if (snap.hasData) {
                  // List<Favorite> menu = snap.data ?? [];
                  return SizedBox(
                      child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snap.data?.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.79,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12),
                    itemBuilder: (context, index) {
                      final data = snap.data?[index];
                      return GestureDetector(
                        onTap: () => Get.toNamed(Routes.DETAIL_MENU,
                            arguments: {
                              "data": snap.data![index].menu,
                              "favorite": true,
                              "id_user": c.idUser
                            }),
                        child: Container(
                          height: 200.w,
                          width: 158.w,
                          decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: AppRadius.all,
                            border:
                                Border.all(color: kDividerItemSectionDashboard),
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
                                            "${c.publicUrlImages}${data?.menu.name}"),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8))),
                              ),
                              SizedBox(
                                  child: Padding(
                                padding: MiddlePadding.all,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${ctrlHome.roundedDistance} Km',
                                      style: AppTextTheme
                                          .current.highlightsBodyHint,
                                    ),
                                    SizedBox(height: 4.w),
                                    Text(
                                      '${data?.menu.name}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextTheme.current.title3,
                                    ),
                                    SizedBox(height: 4.w),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Rp. ${data?.menu.price}',
                                          style: AppTextTheme.current.title5,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            Endpoint endpoint = Endpoint();
                                            await endpoint.deleteFavorite(
                                                data!.menu.id!,
                                                controller.idUser);
                                          },
                                          child: Icon(
                                            IconlyBold.heart,
                                            size: 20,
                                            color: kRed,
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
                  ));
                } else if (snap.hasError) {
                  return Center(child: Text('Error'));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ),
      );
    });
  }
}
