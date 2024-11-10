import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme.dart';
import 'package:news_app/core/router/router_manager.dart';
import 'package:news_app/core/router/routes.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          onGenerateRoute: (settings) => RouterManager.onGenerate(settings),
          initialRoute: Routes.homeRoute,
          theme: AppTheme.light,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
