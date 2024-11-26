import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/article_response/article.dart';
import 'package:news_app/data/model/article_response/article_response.dart';

class ArticlesViewModel extends ChangeNotifier {
  List<Article>? articles;
  bool isLoading = false;
  String? errorMessage;
  void getArticlesBySourceId(String? sourceId, String? inputSearch) async {
    try {
      isLoading = true;
      notifyListeners();
      ArticleResponse articleResponse =
          await ApiManager.getarticlesByScourceId(sourceId, inputSearch);
      isLoading = false;
      if (articleResponse.status == 'ok') {
        articles = articleResponse.articles;
      } else {
        errorMessage = articleResponse.message;
      }
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
