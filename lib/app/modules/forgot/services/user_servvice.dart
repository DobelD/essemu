import 'package:essemu/app/provider/endpoint.dart';

class UserService {
  Endpoint endpoint = Endpoint();

  Future<bool> getUser(String email) async {
    final response = await endpoint.getUsers(email);
    if (response == null) {
      print(false);
      return false;
    } else {
      print(true);
      return true;
    }
  }
}
