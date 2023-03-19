import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  String? idUser;
  Future<void> saveSession(String? user_id, String? myId, String? email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_id', user_id ?? '');
    prefs.setString('id', myId ?? '');
    prefs.setString('email', email ?? '');
  }

  Future getSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    idUser = prefs.getString('id');
    return idUser;
  }

  Future clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}

final session = SessionManager();
