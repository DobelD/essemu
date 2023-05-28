import 'dart:async';
import 'dart:ui';

import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:get/get.dart';

class StreamService {
  static Future<void> init() async {
    final service = FlutterBackgroundService();
    await service.configure(
        iosConfiguration: IosConfiguration(),
        androidConfiguration: AndroidConfiguration(
            onStart: onStart, isForegroundMode: false, autoStart: true));
  }
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();
  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });
    service.on('stopService').listen((event) {
      service.stopSelf();
    });
    Timer.periodic(20.seconds, (timer) async {
      final controller = Get.put(HomeController());
      controller.getOrder();
      print("FG SERVICE RUNNING");
      service.invoke('update');
    });
  }
}

// FlutterBackgroundService().invoke('stopService')
