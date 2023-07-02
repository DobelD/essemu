import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_menu_controller.dart';

class EditMenuView extends GetView<EditMenuController> {
  const EditMenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditMenuView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EditMenuView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
