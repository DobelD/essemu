import 'package:essemu/app/modules/order_proccess/controllers/order_proccess_controller.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SortOrder extends StatelessWidget {
  const SortOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderProccessController>(builder: (c) {
      return Container(
        height: 200,
        padding: DefaultPadding.all,
        decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r))),
        child: Column(
          children: [
            GestureDetector(
                onTap: () => c.sortOrder('priority'),
                child: Text(
                  'Priority',
                  style: AppTextTheme.current.buttonText,
                ))
          ],
        ),
      );
    });
  }
}
