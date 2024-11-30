import 'package:news_app/data/api/result.dart';
import 'package:news_app/data/model/source_response/source.dart';

abstract class SourcesDataSource {
  Future<Result<List<Source>>> getSourcesByCategoryId(String categoryId);
}
