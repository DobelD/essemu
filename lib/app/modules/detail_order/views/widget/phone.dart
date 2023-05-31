import 'package:url_launcher/url_launcher_string.dart';

class DirectToPhone {
  static Future<void> direct(String phone) async {
    await launchUrlString("tel:0$phone", mode: LaunchMode.externalApplication);
  }
}
