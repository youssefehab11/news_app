import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/data/model/source_response/source_response.dart';

class ApiManager {
  static const String _apiKey = 'd3135644a34f4a04a50e63e9e8d9abae';
  static const String _baseUrl = 'newsapi.org';
  static const String _sourcesEndPoint = 'v2/top-headlines/sources';
  static const String _articlesEndPoint = 'v2/everything';

  static Future<SourceResponse> getSourcesByCategoryId(
      String categoryId) async {
    Map<String, dynamic> queryParameters = {
      'apiKey': _apiKey,
      'category': categoryId,
    };
    Uri url = Uri.https(_baseUrl, _sourcesEndPoint, queryParameters);
    http.Response response = await http.get(url);
    return SourceResponse.fromJson(jsonDecode(response.body));
  }

  static Future<ArticleResponse> getarticlesByScourceId(String sourceId) async {
    Map<String, dynamic> queryParameters = {
      'apiKey': _apiKey,
      'sources': sourceId,
    };
    Uri url = Uri.https(_baseUrl, _articlesEndPoint, queryParameters);
    http.Response response = await http.get(url);
    return ArticleResponse.fromJson(jsonDecode(response.body));
  }
}