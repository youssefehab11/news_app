import 'package:flutter/material.dart';
import 'package:news_app/core/base/base_ui_state.dart';

class BaseViewModel<T> extends ChangeNotifier {
  BaseUiState<T> state;
  bool isDisposed = false;
  BaseViewModel({required this.state});

  @override
  void dispose() {
    super.dispose();
    isDisposed = true;
  }

  void emit(BaseUiState<T> newState) {
    if (!isDisposed) {
      state = newState;
      notifyListeners();
    }
  }
}
