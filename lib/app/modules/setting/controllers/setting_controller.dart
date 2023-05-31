import 'package:essemu/app/provider/endpoint.dart';
import 'package:essemu/app/utils/session/session_manager.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/user_rest.dart';
import '../../../routes/app_pages.dart';

class SettingController extends GetxController {
  SupabaseClient client = Supabase.instance.client;
  Endpoint endpoint = Endpoint();
  UserRest rest = UserRest();
  bool isLoading = false;

  getUser() async {
    final data = await session.getUserRest();
    rest = data!;
    update();
  }

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

  updateData() async {
    final adm = await endpoint.setEmailRest(rest.email!);
    session.saveUserRest(UserRest.fromJson(adm));
    getUser();
    update();
  }

  @override
  void onInit() {
    getUser();
    super.onInit();
  }
}
