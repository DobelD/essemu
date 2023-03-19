import 'package:essemu/app/themes/app_theme.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://yccxlnodtgrnbcfdjqcg.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InljY3hsbm9kdGdybmJjZmRqcWNnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzczMDg1MTgsImV4cCI6MTk5Mjg4NDUxOH0.-NHr0UdUhoSZPOhXfEO6uYiUmsWpuYCXpYQrdzZppbs',
  );
  WidgetsFlutterBinding.ensureInitialized();
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
          );
        }),
  );
}
