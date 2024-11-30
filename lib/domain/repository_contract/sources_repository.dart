import 'package:news_app/data/api/result.dart';
import 'package:news_app/domain/entity/source_entity.dart';

abstract class SourcesRepository {
  Future<Result<List<SourceEntity>>> getSourcesByCategoryId(String categoryId);
}
