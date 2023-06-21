import 'package:essemu/app/data/user_rest.dart';
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
      print(response.session);
      print(response.user);
      if (response.user != null) {
        final emm = await endpoint.setEmail(emailC.text);
        session.saveUser(us.User.fromJson(emm));
        final role = await endpoint.getRole(emm);
        print("USER: ${emm}");
        if (role['name'] == 'owner') {
          final adm = await endpoint.setEmailRest(emailC.text);
          session.saveUserRest(UserRest.fromJson(adm));
          session.saveSession(response.user?.id, emailC.text);
          isLoading = false;
          update();
          Get.offAllNamed(Routes.MAIN_ADMIN);
        } else {
          isLoading = false;
          update();
          session.saveSession(response.user?.id, emailC.text);
          Get.offAllNamed(Routes.MAIN_PAGES);
        }
      } else {
        isLoading = false;
        update();
        notRegister();
      }
      isLoading = false;
      update();
    } catch (e) {
      print(e);
      isLoading = false;
      update();
    }
    isLoading = false;
    update();
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
