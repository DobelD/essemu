import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../data/order_rest.dart';
import '../../../../themes/colors/colors.dart';
import '../../../../themes/decoration/app_padding.dart';
import '../../../../themes/typograpy/typo.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key, required this.data, required this.address});

  final Users data;
  final String address;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
            width: Get.width,
            color: kWhite,
            padding: DefaultPadding.all,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
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
                SizedBox(height: 8.w),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text('${data.name} - 0${data.phone}',
                      style: AppTextTheme.current.bodyText),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          '${address}',
                          style: AppTextTheme.current.bodyText,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
