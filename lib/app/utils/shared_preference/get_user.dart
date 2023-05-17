import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../data/user.dart';

class UserData {
  static get() async {
    final sharedPref = await SharedPreferences.getInstance();
    final userJson = sharedPref.getString('user');
    var user;
    user = User.fromJson(jsonDecode(userJson!));
    return user;
  }
}
