import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/api/result.dart';
import 'package:news_app/data/data_scource_contract/articles_data_source.dart';
import 'package:news_app/data/model/article_response/article.dart';

class ArticlesDataSourceImpl extends ArticlesDataSource {
  ApiManager apiManager;
  ArticlesDataSourceImpl({required this.apiManager});
  @override
  Future<Result<List<Article>>> getArticles(
    String sourceId,
    String inputSearch,
  ) {
    return apiManager.getarticlesByScourceId(sourceId, inputSearch);
  }
}
