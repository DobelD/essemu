import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ongkir_controller.dart';

class OngkirView extends GetView<OngkirController> {
  const OngkirView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'OngkirView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
