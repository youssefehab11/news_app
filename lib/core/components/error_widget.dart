import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app/data/api/result.dart';

class AppErrorWidget extends StatelessWidget {
  final ServerError? serverError;
  final Failure? error;
  const AppErrorWidget({
    super.key,
    this.serverError,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(extractErrorMessage()),
    );
  }

  String extractErrorMessage() {
    String errorMessage = 'Something went wrong';
    if (serverError != null) {
      errorMessage = serverError!.errorMessage;
    } else {
      switch (error) {
        case HttpException():
          {
            errorMessage = 'Couldn\'t find the post';
          }
        case SocketException():
          {
            errorMessage = 'No Internet Connection!';
          }
        case TimeoutException():
          errorMessage = 'Please check your internet connection';
      }
    }
    return errorMessage;
  }
}
