import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/api/result.dart';
import 'package:news_app/data/data_scource_contract/sources_data_source.dart';
import 'package:news_app/data/model/source_response/source.dart';

class SourcesDataSourceImpl extends SourcesDataSource {
  ApiManager apiManager;
  SourcesDataSourceImpl({required this.apiManager});
  @override
  Future<Result<List<Source>>> getSourcesByCategoryId(String categoryId) {
    return apiManager.getSourcesByCategoryId(categoryId);
  }
}
