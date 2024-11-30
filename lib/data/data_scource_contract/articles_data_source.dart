import 'package:news_app/data/api/result.dart';
import 'package:news_app/data/model/article_response/article.dart';

abstract class ArticlesDataSource {
  Future<Result<List<Article>>> getArticles(
      String sourceId, String inputSearch);
}
