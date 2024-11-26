import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/application_view_model.dart';
import 'package:news_app/config/theme.dart';
import 'package:news_app/core/router/router_manager.dart';
import 'package:news_app/core/router/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

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
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          onGenerateRoute: (settings) => RouterManager.onGenerate(settings),
          initialRoute: Routes.splashRoute,
          theme: AppTheme.light,
          locale: Locale(context.watch<ApplicationViewModel>().currentLanguage),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
