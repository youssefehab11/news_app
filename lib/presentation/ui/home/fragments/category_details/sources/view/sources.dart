import 'package:flutter/material.dart';
import 'package:news_app/core/base/base_ui_state.dart';
import 'package:news_app/core/components/error_widget.dart';
import 'package:news_app/core/components/loading_widget.dart';
import 'package:news_app/data/model/source_response/source.dart';
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
    viewModel = SourcesViewModel();
    viewModel.getSourcesByCategoryId(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<SourcesViewModel>(
        builder: (context, viewModel, child) {
          BaseUiState<List<Source>> state = viewModel.state;
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
