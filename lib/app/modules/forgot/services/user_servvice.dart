import 'package:essemu/app/provider/endpoint.dart';

import '../../../data/user.dart';

class UserService {
  Endpoint endpoint = Endpoint();

  Future<bool> getUser(String email) async {
    final response = await endpoint.getUsers(email);
    if (response == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<User> checkEmail(String email) async {
    final response = await endpoint.getUsers(email);
    return User.fromJson(response);
  }
}
