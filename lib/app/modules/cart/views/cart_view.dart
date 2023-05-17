import 'package:essemu/app/modules/cart/views/section/add_new_item.dart';
import 'package:essemu/app/modules/cart/views/section/list_menu_section.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import 'section/app_bar.dart';
import 'section/footer_section.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackground,
      body: CustomScrollView(
        slivers: [AppBarSection(), ListMenuSection(), AddNewMenu()],
      ),
      bottomSheet: FooterSection(),
    );
  }
}
