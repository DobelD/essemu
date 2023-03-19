import 'package:essemu/app/components/label_action/label_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../../../../components/bottom_sheet/bottom_sheet.dart';
import '../../../../data/categories.dart';
import '../../../../themes/colors/colors.dart';
import '../../../../themes/typograpy/typo.dart';
import '../../controllers/home_controller.dart';
import '../widget/item_category.dart';
import '../widget/shimmer/category.dart';

class CategorySection extends StatelessWidget {
  const CategorySection(
      {super.key, this.isLoading = true, this.category, this.c});
  final bool isLoading;
  final List<Categories>? category;
  final HomeController? c;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: true,
        delegate:
            MyHeaderDelegate(isLoading: isLoading, category: category, c: c));
  }
}

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  const MyHeaderDelegate({this.isLoading = true, this.category, this.c});

  final bool isLoading;
  final List<Categories>? category;
  final HomeController? c;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return GetBuilder<HomeController>(builder: (ctx) {
      return Container(
        color: kMainBackground,
        child: ctx.loading
            ? CategoryLoading()
            : Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: LabelAction(
                        label: shrinkOffset > 22 ? '' : 'Category',
                        labelAction: shrinkOffset > 22 ? '' : 'See All',
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
                                      label: 'All Category',
                                      child: ItemCategory(
                                          isLoading: isLoading,
                                          category: category));
                                },
                              );
                            },
                          );
                        }),
                  ),
                  SizedBox(height: 16.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.w),
                          child: SizedBox(
                              height: 36.h,
                              child: InkWell(
                                onTap: () {
                                  c?.selectedCategory(99, 0);
                                },
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  height: 36.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      color: c?.selected == 99
                                          ? kMainDark
                                          : kSofterGrey),
                                  child: Center(
                                      child: Text(
                                    "All",
                                    style: AppTextTheme.current.bodyTextWhite,
                                  )),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 36.h,
                          child: ListView.separated(
                              padding: EdgeInsets.only(right: 16.w, left: 12.w),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemBuilder: (_, index) {
                                final data = category?[index];
                                return InkWell(
                                  onTap: () {
                                    c?.selectedCategory(index, data!.id!);
                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                    height: 36.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        color: c?.selected == index
                                            ? kMainDark
                                            : kSofterGrey),
                                    child: Center(
                                        child: Text(
                                      "${data?.name ?? '-'}",
                                      style: AppTextTheme.current.bodyTextWhite,
                                    )),
                                  ),
                                );
                              },
                              separatorBuilder: (__, i) =>
                                  SizedBox(width: 12.w),
                              itemCount: category!.length),
                        ),
                      ],
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
