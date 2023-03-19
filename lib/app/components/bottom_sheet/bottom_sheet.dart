import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BSheet extends StatelessWidget {
  const BSheet({super.key, this.child, this.label, this.isLabel = false});

  final Widget? child;
  final String? label;
  final bool isLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 6.w,
                width: 46.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.r),
                    color: kSoftGrey.withOpacity(0.6)),
              ),
            ),
            isLabel
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: SizedBox(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          '${label}',
                          style: AppTextTheme.current.labelStatusText,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                      ],
                    )),
                  )
                : SizedBox(),
            Padding(padding: EdgeInsets.all(10.w), child: child),
          ],
        ));
  }
}
