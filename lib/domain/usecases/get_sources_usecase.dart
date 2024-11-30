import 'package:news_app/data/api/result.dart';
import 'package:news_app/domain/entity/source_entity.dart';
import 'package:news_app/domain/repository_contract/sources_repository.dart';

class GetSourcesUseCase {
  SourcesRepository repository;
  GetSourcesUseCase({required this.repository});
  Future<Result<List<SourceEntity>>> execute(String categoryId) {
    return repository.getSourcesByCategoryId(categoryId);
  }
}
