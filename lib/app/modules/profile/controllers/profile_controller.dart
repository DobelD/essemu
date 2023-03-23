import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/session/session_manager.dart';

class ProfileController extends GetxController {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController alamat;
  late TextEditingController tlp;

  SupabaseClient client = Supabase.instance.client;
  bool isLoading = false;
  bool isSave = true;

  setSave() {
    isSave = false;
    update();
  }

  setSEdit() {
    isSave = true;
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

  @override
  void onInit() {
    super.onInit();
    name = TextEditingController(text: 'Ali Imron');
    email = TextEditingController(text: 'aliimron@gmail.com');
    alamat = TextEditingController(text: 'Gumukmas');
    tlp = TextEditingController(text: '081234944838');
  }
}
