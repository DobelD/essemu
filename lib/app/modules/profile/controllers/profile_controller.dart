import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/session/session_manager.dart';

class ProfileController extends GetxController {
  SupabaseClient client = Supabase.instance.client;

  logout() async {
    await client.auth.signOut();
    session.clearSession();
    Get.offAllNamed(Routes.AUTH);
  }
}
