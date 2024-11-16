import 'Source.dart';

/// source : {"id":"abc-news","name":"ABC News"}
/// author : "The Associated Press"
/// title : "Speaker Mike Johnson wins GOP nomination to remain in job, faces full House vote in January"
/// description : "Speaker Mike Johnson wins GOP nomination to remain in job, faces full House vote in January"
/// url : "https://abcnews.go.com/Politics/wireStory/speaker-mike-johnson-wins-gop-nomination-remain-job-115837101"
/// urlToImage : "https://s.abcnews.com/images/US/abc_news_default_2000x2000_update_16x9_992.jpg"
/// publishedAt : "2024-11-13T21:26:05Z"
/// content : "Speaker Mike Johnson wins GOP nomination to remain in job, faces full House vote in January\r\nNovember 13, 2024, 4:19 PM\r\nWASHINGTON -- Speaker Mike Johnson wins GOP nomination to remain in job, faces… [+27 chars]"

class Articles {
  Articles({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  Articles.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}