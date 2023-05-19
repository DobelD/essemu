import 'package:essemu/app/components/button/app_button_primary.dart';
import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:essemu/app/modules/home/services/item_order_service.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/item_order.dart';

class DetailOrder extends StatelessWidget {
  const DetailOrder({super.key, required this.idOrder, required this.data});

  final int idOrder;
  final List<ItemOrder> data;

  @override
  Widget build(BuildContext context) {
    ItemOrderService service = ItemOrderService();
    final controller = Get.put(HomeController());
    return Container(
      height: Get.height * 0.7,
      width: Get.width,
      decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r))),
      child: Column(
        children: [
          SizedBox(
              height: 100,
              child: Column(
                  children: List.generate(
                      data.length,
                      (index) => ListTile(
                            title: Text('${data[index].menu.name ?? '-'}'),
                          )))),
          SizedBox(
            height: 52.w,
            child: AppButtonPrimary(
              label: 'Selesai',
              onPressed: () {
                Get.back();
                controller.onOrderDone();
              },
            ),
          ),
        ],
      ),
    );
  }
}
