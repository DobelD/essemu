import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../components/shimmer/shimmer.dart';
import '../../../../data/categories.dart';
import '../../../../themes/colors/colors.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({super.key, this.isLoading = true, this.category});

  final bool isLoading;
  final List<Categories>? category;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
          child: Wrap(
              direction: Axis.horizontal,
              children: List.generate(category?.length ?? 0, (index) {
                final data = category?[index];
                return isLoading
                    ? ItemLoading()
                    : Padding(
                        padding: EdgeInsets.all(6.w),
                        child: Container(
                          height: 110.w,
                          width: 158.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: kMainDark),
                          child: Text('${data?.name ?? '-'}'),
                        ),
                      );
              }))),
    );
  }
}

class ItemLoading extends StatelessWidget {
  const ItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(6.w),
        child:
            AppShimmer(child: AppContentShimmer(hight: 110.w, width: 158.w)));
  }
}
