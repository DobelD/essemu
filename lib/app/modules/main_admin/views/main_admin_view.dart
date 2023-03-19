import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_admin_controller.dart';

class MainAdminView extends GetView<MainAdminController> {
  const MainAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainAdminView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MainAdminView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
