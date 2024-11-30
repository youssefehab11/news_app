import 'package:news_app/data/api/result.dart';
import 'package:news_app/data/data_scource_contract/articles_data_source.dart';
import 'package:news_app/data/model/article_response/article.dart';
import 'package:news_app/domain/entity/article_entity.dart';
import 'package:news_app/domain/repository_contract/articles_repository.dart';

class ArticlesRepositoryImpl extends ArticlesRepository {
  ArticlesDataSource articlesDataSource;
  ArticlesRepositoryImpl({required this.articlesDataSource});
  @override
  Future<Result<List<ArticleEntity>>> getArticles(
    String sourceId,
    String inputSearch,
  ) async {
    Result<List<Article>> result =
        await articlesDataSource.getArticles(sourceId, inputSearch);
    switch (result) {
      case Success<List<Article>>():
        {
          List<ArticleEntity> articlesEntityList = result.data
              .map(
                (article) => article.toArticleEntity(),
              )
              .toList();
          return Success(data: articlesEntityList);
        }
      case ServerError<List<Article>>():
        {
          return ServerError(
              code: result.code, errorMessage: result.errorMessage);
        }
      case Failure<List<Article>>():
        {
          return Failure(exception: result.exception);
        }
    }
  }
}
