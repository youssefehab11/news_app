import 'package:flutter/material.dart';
import 'package:news_app/core/router/routes.dart';
import 'package:news_app/presentation/ui/home/home.dart';
import 'package:news_app/presentation/ui/splash/splash.dart';

class RouterManager {
  static Route<MaterialPageRoute>? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const SplashScreen(),
          );
        }
      case Routes.homeRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const HomeScreen(),
          );
        }
      default:
        {
          return null;
        }
    }
  }
}
