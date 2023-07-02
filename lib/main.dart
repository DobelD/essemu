import 'package:essemu/app/themes/app_theme.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/initialize/supabase_initialize.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Supabase.initialize(
    url: Initial.url,
    anonKey: Initial.key,
  );
  await Permission.location.request();

  runApp(
    ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, widgets) {
          AppTextTheme.init(context);
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Essemu",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            theme: AppTheme.light,
            builder: (context, child) {
              return KeyboardVisibilityProvider(
                child: child!,
              );
            },
          );
        }),
  );
}
