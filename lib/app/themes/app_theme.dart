import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors/colors.dart';
import 'typograpy/typo.dart';

class AppTheme {
  static ThemeData get light => ThemeData.light().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: kMainBackground,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          backgroundColor: kBlack,
          centerTitle: false,
          titleTextStyle: AppTextTheme.current.appBarTitle,
          toolbarHeight: 56.w,
          shadowColor: kAppBarShadow,
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: kMain,
          onPrimary: kMain,
          secondary: kBlack,
          onSecondary: kBlack,
          error: kRed,
          onError: kRed,
          background: kMainBackground,
          onBackground: kMainBackground,
          surface: kWhite,
          onSurface: kWhite,
        ),
        iconTheme: IconThemeData(size: 24.w, color: kMain),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: kBlack,
          selectedLabelStyle: AppTextTheme.current.selectedBottomNavigation,
          unselectedLabelStyle: AppTextTheme.current.unselectedBottomNavigation,
          selectedIconTheme: IconThemeData(size: 24.w, color: kMain),
          unselectedIconTheme: IconThemeData(size: 24.w, color: kWhite),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kMain,
          unselectedItemColor: kWhite,
        ),
      );
}
