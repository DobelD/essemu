import 'package:get/get.dart';

import '../../../utils/session/session_manager.dart';

class FavoriteController extends GetxController {
  String publicUrlImages =
      'https://yccxlnodtgrnbcfdjqcg.supabase.co/storage/v1/object/public/orderfood/';
  int idUser = 0;

  void getUserId() async {
    final user = await session.getUser();
    idUser = user!.id!;
    update();
  }

  @override
  void onInit() {
    getUserId();
    super.onInit();
  }
}
