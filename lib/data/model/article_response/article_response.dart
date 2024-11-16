import 'article.dart';

class ArticleResponse {
  String? status;
  String? code;
  String? message;
  num? totalResults;
  List<Article>? articles;

  ArticleResponse({
    this.status,
    this.totalResults,
    this.code,
    this.message,
    this.articles,
  });

  ArticleResponse.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    code = json['code'];
    message = json['message'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Article.fromJson(v));
      });
    }
  }
}
