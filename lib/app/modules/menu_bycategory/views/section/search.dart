import 'package:essemu/app/components/textfield/text_field_label.dart';
import 'package:essemu/app/modules/menu_bycategory/controllers/menu_bycategory_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../home/views/widget/shimmer/search.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GetBuilder<MenuBycategoryController>(builder: (c) {
        return c.loading
            ? SearchLoading()
            : SizedBox(
                child: AppTextFieldLabel.textSearch(
                controller: c.searchC,
                hintText: 'Search',
                borderColors: false,
                onChange: (value) => c.searchMenu(value),
              ));
      }),
    ));
  }
}
