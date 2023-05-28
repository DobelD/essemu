import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_proccess_controller.dart';
import 'section/appbar_section.dart';
import 'section/body_section.dart';

class OrderProccessView extends GetView<OrderProccessController> {
  const OrderProccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [AppBarSection(), BodySection()],
    ));
  }
}
