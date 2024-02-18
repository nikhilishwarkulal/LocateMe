import 'package:flutter/material.dart';
import 'package:locateme/modules/home/home_screen.dart';

import '../modules/splash/splash_screen.dart';

class AppRoutes {
  // Route name constants
  static const String splashScreen = '/splashScreen';
  static const String homeScreen = '/homeScreen';

  /// The map used to define our routes, needs to be supplied to [MaterialApp]
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splashScreen: (context) => const SplashScreen(),
      homeScreen: (context) => const HomeScreen(),
    };
  }
}
