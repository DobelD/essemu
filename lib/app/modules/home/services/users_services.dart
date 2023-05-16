import 'package:essemu/app/data/user.dart';

import '../../../provider/endpoint.dart';

class UserService {
  Endpoint endpoint = Endpoint();

  Future<User> getData(String email) async {
    try {
      final response = await endpoint.getUsers(email);
      return User.fromJson(response);
    } catch (e) {
      throw "$e";
    }
  }
}
