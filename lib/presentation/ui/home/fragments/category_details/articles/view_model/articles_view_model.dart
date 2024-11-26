import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/api/result.dart';
import 'package:news_app/data/model/article_response/article.dart';

class ArticlesViewModel extends ChangeNotifier {
  ArticlesUIState state = ArticlesLoadingState();
  late bool isDisposed;
  ArticlesViewModel() {
    isDisposed = false;
  }

  @override
  void dispose() {
    super.dispose();
    isDisposed = true;
  }

  void emit(ArticlesUIState newState) {
    if (!isDisposed) {
      state = newState;
      notifyListeners();
    }
  }

  void getArticlesBySourceId(String? sourceId, String? inputSearch) async {
    emit(ArticlesLoadingState());
    Result<List<Article>> result =
        await ApiManager.getarticlesByScourceId(sourceId, inputSearch);
    switch (result) {
      case Success<List<Article>>():
        {
          emit(ArticlesSuccessState(articles: result.data));
        }
      case ServerError<List<Article>>():
        {
          emit(ArticlesErrorState(serverError: result));
        }
      case Failure<List<Article>>():
        {
          emit(ArticlesErrorState(failure: result));
        }
    }
  }
}

sealed class ArticlesUIState {}

class ArticlesSuccessState extends ArticlesUIState {
  List<Article> articles;
  ArticlesSuccessState({required this.articles});
}

class ArticlesLoadingState extends ArticlesUIState {}

class ArticlesErrorState extends ArticlesUIState {
  ServerError? serverError;
  Failure? failure;
  ArticlesErrorState({this.serverError, this.failure});
}
