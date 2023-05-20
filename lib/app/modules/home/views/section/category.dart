import 'package:essemu/app/components/label_action/label_action.dart';
import 'package:essemu/app/utils/assets/svg/svg_assets.dart';
import 'package:essemu/app/utils/label/label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../../../../components/bottom_sheet/bottom_sheet.dart';
import '../../../../themes/colors/colors.dart';
import '../../../../themes/typograpy/typo.dart';
import '../../controllers/home_controller.dart';
import '../widget/item_category.dart';
import '../widget/shimmer/category.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(pinned: true, delegate: MyHeaderDelegate());
  }
}

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return GetBuilder<HomeController>(builder: (c) {
      return Container(
        color: kMainBackground,
        child: c.loading
            ? CategoryLoading()
            : Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: LabelAction(
                        label: shrinkOffset > 22 ? '' : S.categoryLabel,
                        labelAction: shrinkOffset > 22 ? '' : S.seeAll,
                        onTap: () async {
                          showSlidingBottomSheet(
                            context,
                            builder: (BuildContext context) {
                              return SlidingSheetDialog(
                                elevation: 8,
                                cornerRadius: 8.r,
                                snapSpec: const SnapSpec(
                                  snap: true,
                                  snappings: [1.0],
                                  positioning:
                                      SnapPositioning.relativeToAvailableSpace,
                                ),
                                builder: (context, state) {
                                  return BSheet(
                                      isLabel: true,
                                      label: S.allCategory,
                                      child: ItemCategory(
                                          isLoading: c.loading,
                                          category: c.category));
                                },
                              );
                            },
                          );
                        }),
                  ),
                  SizedBox(height: 16.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: SizedBox(
                                height: 36.h,
                                child: InkWell(
                                  onTap: () {
                                    c.selectedCategory(99, 0);
                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                    height: 36.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        color: c.selected == 99
                                            ? kMainDark
                                            : kWhite),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 16.w,
                                          width: 16.w,
                                          child:
                                              SvgPicture.asset(SgAssets.fire),
                                        ),
                                        SizedBox(width: 6.w),
                                        Text(
                                          S.all,
                                          style: c.selected == 99
                                              ? AppTextTheme
                                                  .current.bodyTextWhite
                                              : AppTextTheme.current.bodyText,
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 36.h,
                            child: ListView.separated(
                                padding:
                                    EdgeInsets.only(right: 16.w, left: 12.w),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemBuilder: (_, index) {
                                  final data = c.category[index];
                                  return InkWell(
                                    onTap: () {
                                      c.selectedCategory(index, data.id!);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w),
                                      height: 36.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          color: c.selected == index
                                              ? kMainDark
                                              : kWhite),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 16.w,
                                            width: 16.w,
                                            child: SvgPicture.network(
                                                '${c.pubicUrlCategory}${data.imageUrl}'),
                                          ),
                                          SizedBox(width: 6.w),
                                          Text(
                                            "${data.name ?? '-'}",
                                            style: c.selected == index
                                                ? AppTextTheme
                                                    .current.bodyTextWhite
                                                : AppTextTheme.current.bodyText,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (__, i) =>
                                    SizedBox(width: 12.w),
                                itemCount: c.category.length),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
      );
    });
  }

  @override
  double get maxExtent => 92.h;

  @override
  double get minExtent => 82.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
