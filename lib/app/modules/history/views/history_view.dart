import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/history_controller.dart';
import 'section/app_bar.dart';
import 'section/list_history.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kMainBackground,
        body: CustomScrollView(
          slivers: [AppBarSection(), ListHistory()],
        ));
  }
}
