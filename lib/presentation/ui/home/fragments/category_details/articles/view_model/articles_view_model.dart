import 'package:news_app/core/base/base_ui_state.dart';
import 'package:news_app/core/base/base_view_model.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/api/result.dart';
import 'package:news_app/data/model/article_response/article.dart';

class ArticlesViewModel extends BaseViewModel<List<Article>> {
  ArticlesViewModel() : super(state: LoadingState());

  void getArticlesBySourceId({String? sourceId, String? inputSearch}) async {
    emit(LoadingState());
    Result<List<Article>> result = await ApiManager.getarticlesByScourceId(
      sourceId,
      inputSearch,
    );
    switch (result) {
      case Success<List<Article>>():
        {
          emit(SuccessState(data: result.data));
        }
      case ServerError<List<Article>>():
        {
          emit(ErrorState(serverError: result));
        }
      case Failure<List<Article>>():
        {
          emit(ErrorState(failure: result));
        }
    }
  }
}
