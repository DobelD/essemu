import 'package:essemu/app/provider/endpoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../data/user.dart' as us;
import '../../../routes/app_pages.dart';
import '../../../themes/colors/colors.dart';
import '../../../themes/typograpy/typo.dart';
import '../../../utils/session/session_manager.dart';

class AuthController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  bool isLoading = false;

  SupabaseClient client = Supabase.instance.client;
  Endpoint endpoint = Endpoint();

  void signIn() async {
    isLoading = true;
    update();
    try {
      final response = await client.auth
          .signInWithPassword(email: emailC.text, password: passC.text);
      print(response.user);
      if (response.user != null) {
        final emm = await endpoint.setEmail(emailC.text);
        final role = await endpoint.getRole(emm);
        session.saveUser(us.User.fromJson(emm));
        print("USER: ${emm}");
        if (role['name'] == 'owner') {
          session.saveSession('9', response.user?.id, emailC.text);
          isLoading = false;
          update();
          Get.offAllNamed(Routes.MAIN_ADMIN);
        } else {
          isLoading = false;
          update();
          session.saveSession('9', response.user?.id, emailC.text);

          Get.toNamed(Routes.MAIN_PAGES);
        }
      } else {
        isLoading = false;
        update();
        notRegister();
      }
    } catch (e) {
      print(e);
    }
  }

  notRegister() {
    Get.showSnackbar(GetSnackBar(
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(16),
        backgroundColor: kMain,
        borderRadius: 8,
        mainButton: Icon(
          Icons.close,
          color: kWhite,
          size: 20,
        ),
        messageText: Text('Email atau password salah',
            style: AppTextTheme.current.bodyText)));
  }

  // Future<String> getUserRole(String userId) async {
  //   final response =
  //       await client.from('role').select().eq('user_id', userId).single();
  //   return response['role'];
  // }
}
