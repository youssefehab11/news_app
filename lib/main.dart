import 'package:flutter/material.dart';
import 'package:news_app/application.dart';
import 'package:news_app/application_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationViewModel(),
      child: const NewsApp(),
    ),
  );
}
