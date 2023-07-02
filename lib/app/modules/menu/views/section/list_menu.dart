import 'package:essemu/app/modules/menu/controllers/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../themes/colors/colors.dart';
import '../../../../themes/decoration/app_padding.dart';
import '../../../../themes/typograpy/typo.dart';

class ListMenu extends StatelessWidget {
  const ListMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuControllers>(builder: (c) {
      return SliverToBoxAdapter(
          child: SizedBox(
              height: 600,
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: c.menu.length,
                      itemBuilder: (_, index) {
                        final data = c.menu[index];
                        return Container(
                            color: kAlert1,
                            height: 32.w,
                            width: MediaQuery.of(context).size.width * 0.7,
                            padding: DefaultPadding.all,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 4,
                                    child: Text('${data.name}',
                                        style: AppTextTheme.current.bodyText)),
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
                      }))));
    });
  }
}
