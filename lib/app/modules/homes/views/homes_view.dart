import 'package:essemu/app/modules/homes/views/section/category.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../themes/colors/colors.dart';
import '../controllers/homes_controller.dart';
import 'section/header.dart';
import 'section/menu.dart';
import 'section/safe_area.dart';

class HomesView extends GetView<HomesController> {
  const HomesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kMainBackground,
        body: RefreshIndicator(
          onRefresh: () async {},
          child: CustomScrollView(
            slivers: [
              HeaderSection(),
              SafeAreaSection(),
              CategorySection(),
              MenuSection()
            ],
          ),
        ));
  }
}
