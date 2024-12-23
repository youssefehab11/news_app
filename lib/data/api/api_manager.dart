import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/data/api/result.dart';
import 'package:news_app/data/model/article_response/article.dart';
import 'package:news_app/data/model/article_response/article_response.dart';
import 'package:news_app/data/model/source_response/source.dart';
import 'package:news_app/data/model/source_response/source_response.dart';

class ApiManager {
  static const String _apiKey = 'd3135644a34f4a04a50e63e9e8d9abae';
  static const String _baseUrl = 'newsapi.org';
  static const String _sourcesEndPoint = 'v2/top-headlines/sources';
  static const String _articlesEndPoint = 'v2/everything';

  Future<Result<List<Source>>> getSourcesByCategoryId(
    String categoryId,
  ) async {
    Map<String, dynamic> queryParameters = {
      'apiKey': _apiKey,
      'category': categoryId,
    };
    Uri url = Uri.https(_baseUrl, _sourcesEndPoint, queryParameters);

    try {
      http.Response response = await http.get(url);
      var json = jsonDecode(response.body);
      SourceResponse sourceResponse = SourceResponse.fromJson(json);
      if (sourceResponse.status == 'ok') {
        return Success(data: sourceResponse.sources ?? []);
      } else {
        return ServerError(
          code: sourceResponse.code!,
          errorMessage: sourceResponse.message!,
        );
      }
    } on Exception catch (exception) {
      return Failure(exception: exception);
    }
  }

  Future<Result<List<Article>>> getarticlesByScourceId(
    String? sourceId,
    String? inputSearch,
  ) async {
    Map<String, dynamic> queryParameters = {
      'apiKey': _apiKey,
      'sources': sourceId,
      'q': inputSearch,
      'sortBy': 'publishedAt',
      'language': 'en'
    };
    Uri url = Uri.https(_baseUrl, _articlesEndPoint, queryParameters);
    try {
      http.Response response = await http.get(url);
      var json = jsonDecode(response.body);
      ArticleResponse articleResponse = ArticleResponse.fromJson(json);
      if (articleResponse.status == 'ok') {
        return Success(data: articleResponse.articles ?? []);
      } else {
        return ServerError(
            code: articleResponse.code!,
            errorMessage: articleResponse.message!);
      }
    } on Exception catch (exception) {
      return Failure(exception: exception);
    }
  }
}
