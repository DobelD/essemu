import 'package:essemu/app/provider/endpoint.dart';

class RegistService {
  Endpoint endpoint = Endpoint();

  Future<bool> regs(
      String emailC,
      String passwordC,
      String passComfirmC,
      String nameC,
      String addressC,
      String imagesUrlC,
      String phoneC,
      int roleC,
      String gender) async {
    if (emailC.isNotEmpty && passwordC.isNotEmpty ||
        passComfirmC == passwordC) {
      final response = await endpoint.register(emailC, passwordC);
      final addUser = await endpoint.addUsers(
          payload(nameC, emailC, addressC, imagesUrlC, phoneC, roleC, gender));
      return true;
    } else {
      return false;
    }
  }

  Map<String, dynamic> payload(String name, String email, String address,
      String imagesUrl, String phone, int role, String gender) {
    Map<String, dynamic> temp = <String, dynamic>{};
    temp['name'] = name;
    temp['email'] = email;
    temp['address'] = address;
    temp['images_url'] = imagesUrl;
    temp['phone'] = phone;
    temp['role_id'] = role;
    temp['gender'] = gender;
    return temp;
  }
}
