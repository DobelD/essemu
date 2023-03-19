import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/session/session_manager.dart';

class SplashController extends GetxController {
  SupabaseClient client = Supabase.instance.client;

  Future<void> login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Future.delayed(Duration(seconds: 3), () {
      session.getSession().then((value) async {
        if (value != null) {
          final emm = await client
              .from('users')
              .select('*')
              .eq('email', prefs.getString('email'))
              .single();
          final role = await client
              .from('role')
              .select('name')
              .eq('id', emm['role_id'])
              .single();
          if (role['name'] == 'owner') {
            Get.offAllNamed(Routes.MAIN_ADMIN);
          } else {
            Get.toNamed(Routes.MAIN_PAGES);
          }
        } else {
          Get.offAllNamed(Routes.AUTH);
        }
      });
    });
  }
}
