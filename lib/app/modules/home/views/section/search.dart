import 'package:essemu/app/components/textfield/text_field_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/shimmer/search.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key, this.isLoading = true});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: isLoading
          ? SearchLoading()
          : SizedBox(
              child: AppTextFieldLabel.textSearch(
              controller: TextEditingController(),
              hintText: 'Search',
              borderColors: false,
            )),
    ));
  }
}
