import 'package:flutter/material.dart';
import 'package:news_app/core/components/error_widget.dart';
import 'package:news_app/core/components/loading_widget.dart';
import 'package:news_app/presentation/ui/home/fragments/category_details/sources/view_model/sources_view_model.dart';
import 'package:news_app/presentation/ui/home/fragments/category_details/sources/widgets/source_tabs.dart';
import 'package:provider/provider.dart';

class Sources extends StatefulWidget {
  final String categoryId;
  const Sources({
    super.key,
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
          SourcesUIState state = viewModel.state;
          switch (state) {
            case SourcesSuccessState():
              {
                return SourceTabs(
                  sources: state.sources,
                );
              }
            case SourcesLoadingState():
              {
                return LoadingWidget();
              }
            case SourcesErrorState():
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
