import 'package:news_app/data/api/result.dart';
import 'package:news_app/domain/entity/article_entity.dart';
import 'package:news_app/domain/repository_contract/articles_repository.dart';

class GetArticlesUsecase {
  ArticlesRepository repository;
  GetArticlesUsecase({required this.repository});
  Future<Result<List<ArticleEntity>>> execute(
      String sourceId, String inputSearch) {
    return repository.getArticles(sourceId, inputSearch);
  }
}
