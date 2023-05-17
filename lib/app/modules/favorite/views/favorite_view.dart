import 'package:essemu/app/modules/favorite/views/section/list_favorite.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favorite_controller.dart';
import 'section/app_bar.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());
    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   child: const Icon(Icons.add),
        //   onPressed: () {
        //     controller.getFavorite();
        //   },
        // ),
        backgroundColor: kMainBackground,
        body: CustomScrollView(
          slivers: [AppBarSection(), ListFavorite()],
        ));
  }
}
