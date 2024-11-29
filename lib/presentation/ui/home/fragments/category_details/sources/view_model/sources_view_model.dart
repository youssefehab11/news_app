import 'package:news_app/core/base/base_ui_state.dart';
import 'package:news_app/core/base/base_view_model.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/api/result.dart';
import 'package:news_app/data/model/source_response/source.dart';

class SourcesViewModel extends BaseViewModel<List<Source>> {
  SourcesViewModel() : super(state: LoadingState());

  void getSourcesByCategoryId(String categoryId) async {
    emit(LoadingState());
    Result<List<Source>> result =
        await ApiManager.getSourcesByCategoryId(categoryId);
    switch (result) {
      case Success<List<Source>>():
        {
          emit(SuccessState(data: result.data));
        }
      case ServerError<List<Source>>():
        {
          emit(ErrorState(serverError: result));
        }
      case Failure<List<Source>>():
        {
          emit(ErrorState(failure: result));
        }
    }
  }
}
