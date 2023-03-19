import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelAction extends StatelessWidget {
  const LabelAction(
      {super.key,
      this.onTap,
      this.label,
      this.labelAction,
      this.isactiveAction = true});

  final GestureTapCallback? onTap;
  final String? label;
  final String? labelAction;
  final bool isactiveAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${label}',
          style: AppTextTheme.current.labelStatusText,
        ),
        isactiveAction
            ? InkWell(
                borderRadius: BorderRadius.circular(4.r),
                onTap: onTap,
                child: Text(
                  '${labelAction}',
                  style: AppTextTheme.current.labelTextAction,
                ))
            : SizedBox()
      ],
    );
  }
}
