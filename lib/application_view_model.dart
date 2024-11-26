import 'package:flutter/material.dart';

class ApplicationViewModel extends ChangeNotifier {
  String currentLanguage = 'en';
  void changeLanguage(String newLanguage) {
    if (currentLanguage != newLanguage) {
      currentLanguage = newLanguage;
      notifyListeners();
    }
  }
}
