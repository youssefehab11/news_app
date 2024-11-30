import 'package:flutter/material.dart';
import 'package:news_app/core/base/base_ui_state.dart';
import 'package:news_app/core/components/error_widget.dart';
import 'package:news_app/core/components/loading_widget.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/data_source_impl/sources_data_source_impl.dart';
import 'package:news_app/data/repository_impl/sources_repository_impl.dart';
import 'package:news_app/domain/entity/source_entity.dart';
import 'package:news_app/domain/usecases/get_sources_usecase.dart';
import 'package:news_app/presentation/ui/home/fragments/category_details/sources/view_model/sources_view_model.dart';
import 'package:news_app/presentation/ui/home/fragments/category_details/sources/widgets/source_tabs.dart';
import 'package:provider/provider.dart';

class Sources extends StatefulWidget {
  final String categoryId;
  final String language;
  const Sources({
    super.key,
    required this.language,
    required this.categoryId,
  });

  @override
  State<Sources> createState() => _SourcesState();
}

class _SourcesState extends State<Sources> {
  late SourcesViewModel viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = SourcesViewModel(
        getSourcesUseCase: GetSourcesUseCase(
      repository: SourcesRepositoryImpl(
        sourcesDataSource: SourcesDataSourceImpl(
          apiManager: ApiManager(),
        ),
      ),
    ));
    viewModel.getSourcesByCategoryId(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<SourcesViewModel>(
        builder: (context, viewModel, child) {
          BaseUiState<List<SourceEntity>> state = viewModel.state;
          switch (state) {
            case SuccessState():
              {
                return SourceTabs(
                  sources: state.data,
                );
              }
            case LoadingState():
              {
                return LoadingWidget();
              }
            case ErrorState():
              {
                return AppErrorWidget(
                  serverError: state.serverError,
                  error: state.failure,
                );
              }
          }
        },
      ),
    );
  }
}
