import 'source.dart';

class SourceResponse {
  String? status;
  String? code;
  String? message;
  List<Source>? sources;

  SourceResponse({
    this.status,
    this.sources,
    this.code,
    this.message,
  });

  SourceResponse.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }
}
