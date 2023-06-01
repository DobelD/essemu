import 'package:essemu/app/provider/endpoint.dart';

import '../../../data/user.dart';
import '../../../utils/session/session_manager.dart';

class EditProfileService {
  Endpoint endpoint = Endpoint();

  Future<bool> updates(int id, String name, String email, String gender,
      String phone, String address) async {
    if (id != 0) {
      await endpoint.updateUser(
          payload(name, email, gender, phone, address), id);
      final emm = await endpoint.setEmail(email);
      session.saveUser(User.fromJson(emm));
      return true;
    } else {
      return false;
    }
  }

  Map<String, dynamic> payload(
      String name, String email, String gender, String phone, String address) {
    Map<String, dynamic> temp = <String, dynamic>{};
    temp['name'] = name;
    temp['email'] = email;
    temp['gender'] = gender;
    temp['phone'] = phone;
    temp['address'] = address;

    return temp;
  }
}
