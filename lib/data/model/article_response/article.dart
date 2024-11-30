import 'package:news_app/data/model/source_response/source.dart';
import 'package:news_app/domain/entity/article_entity.dart';

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Article.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  ArticleEntity toArticleEntity() {
    return ArticleEntity(
      author: author,
      sourceName: source?.name,
      description: description,
      publishedAt: publishedAt,
      sourceId: source?.id,
      title: title,
      url: url,
      urlToImage: urlToImage,
    );
  }
}
