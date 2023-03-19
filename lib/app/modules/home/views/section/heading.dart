import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

import '../../../../themes/colors/colors.dart';
import '../../../../themes/typograpy/typo.dart';
import '../widget/shimmer/heading.dart';

class HeadingSection extends StatelessWidget {
  const HeadingSection({super.key, this.isLoading = true});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: isLoading
          ? HeadingLoading()
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            Text(
                              'Hello Ali!',
                              style: AppTextTheme.current.title2,
                            ),
                            SizedBox(
                                height: 24.w,
                                width: 24.w,
                                child: Lottie.network(
                                    'https://assets8.lottiefiles.com/packages/lf20_6niurjte.json'))
                          ],
                        ),
                      ),
                      Text(
                        "it's launch time",
                        style: AppTextTheme.current.highlightsBody,
                      ),
                    ],
                  ),
                ),
                Icon(IconlyLight.buy, color: kBlack)
              ],
            ),
    ));
  }
}
