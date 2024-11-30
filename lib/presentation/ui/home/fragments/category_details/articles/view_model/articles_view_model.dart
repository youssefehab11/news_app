import 'package:news_app/core/base/base_ui_state.dart';
import 'package:news_app/core/base/base_view_model.dart';
import 'package:news_app/data/api/result.dart';
import 'package:news_app/domain/entity/article_entity.dart';
import 'package:news_app/domain/usecases/get_articles_usecase.dart';

class ArticlesViewModel extends BaseViewModel<List<ArticleEntity>> {
  GetArticlesUsecase usecase;
  ArticlesViewModel({required this.usecase}) : super(state: LoadingState());

  void getArticlesBySourceId({String? sourceId, String? inputSearch}) async {
    emit(LoadingState());
    Result<List<ArticleEntity>> result = await usecase.execute(
      sourceId ?? '',
      inputSearch ?? '',
    );
    switch (result) {
      case Success<List<ArticleEntity>>():
        {
          emit(SuccessState(data: result.data));
        }
      case ServerError<List<ArticleEntity>>():
        {
          emit(ErrorState(serverError: result));
        }
      case Failure<List<ArticleEntity>>():
        {
          emit(ErrorState(failure: result));
        }
    }
  }
}
