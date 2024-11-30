import 'package:news_app/core/base/base_ui_state.dart';
import 'package:news_app/core/base/base_view_model.dart';
import 'package:news_app/data/api/result.dart';
import 'package:news_app/domain/entity/source_entity.dart';
import 'package:news_app/domain/usecases/get_sources_usecase.dart';

class SourcesViewModel extends BaseViewModel<List<SourceEntity>> {
  GetSourcesUseCase getSourcesUseCase;
  SourcesViewModel({required this.getSourcesUseCase})
      : super(state: LoadingState());

  void getSourcesByCategoryId(String categoryId) async {
    emit(LoadingState());
    Result<List<SourceEntity>> result =
        await getSourcesUseCase.execute(categoryId);
    switch (result) {
      case Success<List<SourceEntity>>():
        emit(SuccessState(data: result.data));
      case ServerError<List<SourceEntity>>():
        emit(ErrorState(serverError: result));
      case Failure<List<SourceEntity>>():
        emit(ErrorState(failure: result));
    }
  }
}
