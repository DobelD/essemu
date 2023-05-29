import 'package:essemu/app/provider/endpoint.dart';

import '../../../data/user.dart';

class ProfileService {
  Endpoint endpoint = Endpoint();

  Future<User> getUsers(String email) async {
    try {
      final response = await endpoint.getUsers(email);
      return User.fromJson(response);
    } catch (e) {
      throw "$e";
    }
  }
}
