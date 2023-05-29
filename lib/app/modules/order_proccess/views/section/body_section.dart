import 'package:essemu/app/modules/order_proccess/controllers/order_proccess_controller.dart';
import 'package:essemu/app/modules/order_proccess/views/section/in_order_section.dart';
import 'package:essemu/app/modules/order_proccess/views/section/on_delivery.dart';
import 'package:essemu/app/modules/order_proccess/views/section/on_proccess_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodySection extends StatelessWidget {
  const BodySection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderProccessController());
    return SliverToBoxAdapter(
        child: SizedBox(
      height: 600,
      child: TabBarView(
        controller: controller.controlTabs,
        children: [InOrderSection(), OnProccessSection(), OnDelivery()],
      ),
    ));
  }
}
