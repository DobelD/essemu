import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../themes/colors/colors.dart';
import '../controllers/history_resto_controller.dart';
import 'section/app_bar.dart';
import 'section/list_history.dart';

class HistoryRestoView extends GetView<HistoryRestoController> {
  const HistoryRestoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kMainBackground,
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(2.seconds, () {
              controller.getData();
            });
          },
          child: CustomScrollView(
            slivers: [AppBarSection(), ListHistory()],
          ),
        ));
  }
}
