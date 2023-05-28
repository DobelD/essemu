import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/history_resto_controller.dart';

class HistoryRestoView extends GetView<HistoryRestoController> {
  const HistoryRestoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HistoryRestoView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HistoryRestoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
