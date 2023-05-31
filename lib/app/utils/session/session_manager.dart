import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../data/user.dart';
import '../../data/user_rest.dart';

class SessionManager {
  String? idUser;
  Future<void> saveSession(String? user_id, String? myId, String? email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_id', user_id ?? '');
    prefs.setString('id', myId ?? '');
    prefs.setString('email', email ?? '');
  }

  void saveUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', json.encode(user.toJson()));
  }

  void saveUserRest(UserRest user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_rest', json.encode(user.toJson()));
  }

  Future<User?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('user');
    if (userData != null) {
      Map<String, dynamic> userJson = json.decode(userData);
      return User.fromJson(userJson);
    }
    return null;
  }

  Future<UserRest?> getUserRest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('user_rest');
    if (userData != null) {
      Map<String, dynamic> userJson = json.decode(userData);
      return UserRest.fromJson(userJson);
    }
    return null;
  }

  Future getSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    idUser = prefs.getString('id');
    return idUser;
  }

  String? email;
  Future getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
    return email;
  }

  String? id;
  Future getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString('id');
    return id;
  }

  Future clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}

final session = SessionManager();
