import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../components/shimmer/shimmer.dart';

class MenuLoading extends StatelessWidget {
  const MenuLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Wrap(
            direction: Axis.horizontal,
            children: List.generate(
                4,
                (index) => Padding(
                      padding: EdgeInsets.all(6.w),
                      child: AppShimmer(
                          child: AppContentShimmer(hight: 180, width: 158)),
                    )),
          ),
        )
      ],
    );
  }
}
