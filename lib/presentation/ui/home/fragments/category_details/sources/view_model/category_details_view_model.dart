import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/source_response/source.dart';
import 'package:news_app/data/model/source_response/source_response.dart';

class SourcesViewModel extends ChangeNotifier {
  List<Source>? sources;
  bool isLoading = false;
  String? errorMessage;
  void getSourcesByCategoryId(String categoryId) async {
    try {
      isLoading = true;
      notifyListeners();
      SourceResponse sourceResponse =
          await ApiManager.getSourcesByCategoryId(categoryId);
      isLoading = false;
      if (sourceResponse.status == 'ok') {
        sources = sourceResponse.sources;
      } else {
        errorMessage = sourceResponse.message;
      }
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
