import 'package:news_app/data/api/result.dart';

sealed class BaseUiState<T> {}

class SuccessState<T> extends BaseUiState<T> {
  T data;
  SuccessState({required this.data});
}

class LoadingState<T> extends BaseUiState<T> {}

class ErrorState<T> extends BaseUiState<T> {
  ServerError? serverError;
  Failure? failure;
  ErrorState({this.serverError, this.failure});
}
