import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/session/session_manager.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  SupabaseClient client = Supabase.instance.client;
  AnimationController? ctrl;
  Animation<double>? animation;

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

  @override
  void onInit() {
    ctrl = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    animation = CurvedAnimation(
      parent: ctrl!,
      curve: Curves.easeInOut,
    );
    super.onInit();
  }

  @override
  void onClose() {
    ctrl!.dispose();
    super.onClose();
  }
}
