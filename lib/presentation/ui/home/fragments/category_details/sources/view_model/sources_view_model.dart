import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/api/result.dart';
import 'package:news_app/data/model/source_response/source.dart';

class SourcesViewModel extends ChangeNotifier {
  SourcesUIState state = SourcesLoadingState();
  late bool isDisposed;
  SourcesViewModel() {
    isDisposed = false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    isDisposed = true;
  }

  void emit(SourcesUIState newState) {
    if (!isDisposed) {
      state = newState;
      notifyListeners();
    }
  }

  void getSourcesByCategoryId(String categoryId) async {
    emit(SourcesLoadingState());
    Result<List<Source>> result =
        await ApiManager.getSourcesByCategoryId(categoryId);
    switch (result) {
      case Success<List<Source>>():
        {
          emit(SourcesSuccessState(sources: result.data));
        }
      case ServerError<List<Source>>():
        {
          emit(SourcesErrorState(serverError: result));
        }
      case Failure<List<Source>>():
        {
          emit(SourcesErrorState(failure: result));
        }
    }
  }
}

sealed class SourcesUIState {}

class SourcesSuccessState extends SourcesUIState {
  List<Source> sources;
  SourcesSuccessState({required this.sources});
}

class SourcesLoadingState extends SourcesUIState {}

class SourcesErrorState extends SourcesUIState {
  ServerError? serverError;
  Failure? failure;
  SourcesErrorState({this.failure, this.serverError});
}
