import 'package:essemu/app/data/user.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../themes/typograpy/typo.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key, required this.data});

  final User data;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
            width: Get.width,
            color: kWhite,
            padding: DefaultPadding.side,
            child: Material(
              color: Colors.transparent,
              child: ExpansionTile(
                backgroundColor: kWhite,
                iconColor: kGrey2,
                collapsedIconColor: kGrey2,
                tilePadding: EdgeInsets.zero,
                childrenPadding: EdgeInsets.symmetric(horizontal: 22.w),
                controlAffinity: ListTileControlAffinity.trailing,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent)),
                collapsedShape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent)),
                title: Row(
                  children: [
                    Icon(
                      IconlyLight.location,
                      color: kPrimary2,
                      size: 18,
                    ),
                    SizedBox(width: 4.w),
                    Text('Alamat Pengiriman',
                        style: AppTextTheme.current.bodyText),
                  ],
                ),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${data.name} - ${data.phone}',
                          style: AppTextTheme.current.bodyText),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              '${data.address}',
                              style: AppTextTheme.current.bodyText,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          GestureDetector(
                              onTap: () {},
                              child: Icon(
                                IconlyLight.edit,
                                color: kGrey2,
                                size: 22,
                              ))
                        ],
                      ),
                      SizedBox(height: 12.w),
                    ],
                  )
                ],
              ),
            )));
  }
}


// Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Align(
//                     alignment: Alignment.topCenter,
                    // child: Icon(
                    //   IconlyLight.location,
                    //   color: kPrimary2,
                    //   size: 18,
                    // )),
//                 SizedBox(width: 4.w),
//                 Expanded(
//                     flex: 8,
                    // child: Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     SizedBox(height: 2.w),
                    //     Text('Alamat Pengiriman',
                    //         style: AppTextTheme.current.bodyText),
                    //     SizedBox(height: 4.w),
                    //     Text('${data.name} - ${data.phone}',
                    //         style: AppTextTheme.current.bodyText),
                    //     Text(
                    //       '${data.address}',
                    //       style: AppTextTheme.current.bodyText,
                    //       maxLines: 5,
                    //       overflow: TextOverflow.ellipsis,
                    //     ),
                    //   ],
                    // )
// ),
//                 Icon(
//                   IconlyLight.arrow_right_2,
//                   color: kGrey2,
//                   size: 18,
//                 ),
//               ],
//             )
