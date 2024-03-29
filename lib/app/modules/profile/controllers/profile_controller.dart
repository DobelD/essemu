import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/session/session_manager.dart';
import '../../../data/user.dart' as u;

class ProfileController extends GetxController {
  SupabaseClient client = Supabase.instance.client;
  String urlUsers =
      'https://yccxlnodtgrnbcfdjqcg.supabase.co/storage/v1/object/public/users/';
  bool isLoading = false;
  bool isSave = true;

  u.User user = u.User();

  logout() async {
    isLoading = true;
    update();
    await client.auth.signOut();
    session.clearSession();
    Future.delayed(1.seconds, () {
      isLoading = false;
      update();
      Get.offAllNamed(Routes.AUTH);
    });
  }

  getUser() async {
    final data = await session.getUser();
    user = data!;
    update();
  }

  @override
  void onInit() {
    getUser();
    super.onInit();
  }
}
