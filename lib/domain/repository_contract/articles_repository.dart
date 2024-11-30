import 'package:news_app/data/api/result.dart';
import 'package:news_app/domain/entity/article_entity.dart';

abstract class ArticlesRepository {
  Future<Result<List<ArticleEntity>>> getArticles(
      String sourceId, String inputSearch);
}
