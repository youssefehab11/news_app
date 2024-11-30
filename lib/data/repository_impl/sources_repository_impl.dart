import 'package:news_app/data/api/result.dart';
import 'package:news_app/data/data_scource_contract/sources_data_source.dart';
import 'package:news_app/data/model/source_response/source.dart';
import 'package:news_app/domain/entity/source_entity.dart';
import 'package:news_app/domain/repository_contract/sources_repository.dart';

class SourcesRepositoryImpl extends SourcesRepository {
  SourcesDataSource sourcesDataSource;
  SourcesRepositoryImpl({required this.sourcesDataSource});
  @override
  Future<Result<List<SourceEntity>>> getSourcesByCategoryId(
      String categoryId) async {
    Result<List<Source>> result =
        await sourcesDataSource.getSourcesByCategoryId(categoryId);
    switch (result) {
      case Success<List<Source>>():
        {
          List<SourceEntity> sourceEntityList =
              result.data.map((source) => source.toSourceEntity()).toList();
          return Success(data: sourceEntityList);
        }
      case ServerError<List<Source>>():
        {
          return ServerError(
              code: result.code, errorMessage: result.errorMessage);
        }
      case Failure<List<Source>>():
        {
          return Failure(exception: result.exception);
        }
    }
  }
}
