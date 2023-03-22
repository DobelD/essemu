import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/session/session_manager.dart';

class ProfileController extends GetxController {
  SupabaseClient client = Supabase.instance.client;
  bool isLoading = false;
  bool isSave = true;

  setAction() {
    isSave = false;
    update();
  }

  logout() async {
    isLoading = true;
    update();
    await client.auth.signOut();
    session.clearSession();
    isLoading = false;
    update();
    Get.offAllNamed(Routes.AUTH);
  }
}
