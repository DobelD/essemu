import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../../../data/categories.dart';
import '../../../../themes/typograpy/typo.dart';

class ItemMenu extends StatelessWidget {
  const ItemMenu({super.key, required this.data});

  final Menu data;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: kAlert1,
        height: 32.w,
        width: MediaQuery.of(context).size.width * 0.7,
        padding: DefaultPadding.all,
        child: Row(
          children: [
            Expanded(
                flex: 4,
                child:
                    Text('${data.name}', style: AppTextTheme.current.bodyText)),
            Expanded(
                flex: 3,
                child: Text('${data.price}',
                    style: AppTextTheme.current.bodyText)),
            Expanded(
                flex: 2,
                child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      IconlyBold.edit,
                      color: kPrimary1,
                    ))),
            Expanded(
                flex: 2,
                child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      IconlyBold.delete,
                      color: kWarning1,
                    ))),
          ],
        ));
  }
}
