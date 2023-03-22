import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_menu_controller.dart';

class AddMenuView extends GetView<AddMenuController> {
  const AddMenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddMenuView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddMenuView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
