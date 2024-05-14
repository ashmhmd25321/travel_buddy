import 'package:flutter/material.dart';
import 'package:travelbuddy2/presentation/splash_screen/splash_screen.dart';
import 'package:travelbuddy2/presentation/login_screen/login_screen.dart';
import 'package:travelbuddy2/presentation/homepage_screen/homepage_screen.dart';
import 'package:travelbuddy2/presentation/map_screen/map_screen.dart';
import 'package:travelbuddy2/presentation/profile_container_screen/profile_container_screen.dart';
import 'package:travelbuddy2/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/login_screen';

  static const String homepageScreen = '/homepage_screen';

  static const String mapScreen = '/map_screen';

  static const String profilePage = '/profile_page';

  static const String profileContainerScreen = '/profile_container_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    homepageScreen: (context) => HomepageScreen(),
    mapScreen: (context) => MapScreen(),
    profileContainerScreen: (context) => ProfileContainerScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
