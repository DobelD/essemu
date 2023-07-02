import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../../data/favorite.dart';
import '../../../provider/endpoint.dart';
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

  void deleteFavorite(Favorite? data) async {
    Endpoint endpoint = Endpoint();
    await endpoint.deleteFavorite(data?.menu.id ?? 0, idUser);
    final homeC = Get.put(HomeController());
    homeC.getMenu(homeC.idSelected);
  }

  @override
  void onInit() {
    getUserId();
    super.onInit();
  }
}
