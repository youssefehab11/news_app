sealed class Result<T> {}

class Success<T> extends Result<T> {
  T data;
  Success({required this.data});
}

class ServerError<T> extends Result<T> {
  String code;
  String errorMessage;
  ServerError({required this.code, required this.errorMessage});
}

class Failure<T> extends Result<T> {
  Exception exception;
  Failure({required this.exception});
}
