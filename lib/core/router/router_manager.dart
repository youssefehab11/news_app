import 'package:flutter/material.dart';
import 'package:news_app/core/router/routes.dart';
import 'package:news_app/data/model/article_response/article.dart';
import 'package:news_app/presentation/ui/article_details/article_details.dart';
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
      case Routes.articleDetailsRoute:
        {
          Article article = settings.arguments as Article;
          return MaterialPageRoute(
            builder: (_) => ArticleDetails(
              article: article,
            ),
          );
        }
      default:
        {
          return null;
        }
    }
  }
}
