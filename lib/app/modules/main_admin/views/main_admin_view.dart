import 'package:essemu/app/components/loading_action/loading_action.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_admin_controller.dart';
import 'section/drawer.dart';

class MainAdminView extends GetView<MainAdminController> {
  const MainAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainAdminController>(builder: (c) {
      return AppLoading(
        isLoading: c.isLoading,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Essemu Coffe & Kitchen'),
              centerTitle: true,
            ),
            drawer: Drawers(),
            body: IndexedStack(index: c.indexPage, children: c.page)),
      );
    });
  }
}
