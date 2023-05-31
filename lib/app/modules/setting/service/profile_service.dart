import 'package:essemu/app/provider/endpoint.dart';

import '../../../data/user_rest.dart';

class ProfileService {
  Endpoint endpoint = Endpoint();

  Future<UserRest> getUsers(String email) async {
    try {
      final response = await endpoint.getUsersRest(email);
      return UserRest.fromJson(response);
    } catch (e) {
      throw "$e";
    }
  }
}
