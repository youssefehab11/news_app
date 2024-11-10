import 'package:flutter/material.dart';
import 'package:news_app/core/router/routes.dart';
import 'package:news_app/presentation/ui/home/home.dart';

class RouterManager {
  static Route<MaterialPageRoute>? onGenerate(RouteSettings settings) {
    switch (settings.name) {
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
