import 'package:url_launcher/url_launcher_string.dart';

class SendNotes {
  static Future<void> direct(String pesan) async {
    await launchUrlString("https://wa.me/+6285158891453?text=$pesan",
        mode: LaunchMode.externalApplication);
  }
}
