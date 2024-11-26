import 'package:flutter/material.dart';
import 'package:news_app/core/components/error_widget.dart';
import 'package:news_app/core/components/loading_widget.dart';
import 'package:news_app/data/model/source_response/source.dart';
import 'package:news_app/models/category_dm.dart';
import 'package:news_app/presentation/ui/home/fragments/category_details/sources/view_model/category_details_view_model.dart';
import 'package:news_app/presentation/ui/home/fragments/category_details/sources/widgets/source_tabs.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  final CategoryDM categoryDM;
  const CategoryDetails({
    super.key,
    required this.categoryDM,
  });

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  late SourcesViewModel viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = SourcesViewModel();
    viewModel.getSourcesByCategoryId(widget.categoryDM.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<SourcesViewModel>(
        builder: (context, value, child) {
          if (viewModel.isLoading) {
            return LoadingWidget();
          }
          if (viewModel.errorMessage != null) {
            return AppErrorWidget(
              errorMessage: viewModel.errorMessage!,
            );
          }
          List<Source>? sources = viewModel.sources;
          return SourceTabs(
            sources: sources ?? [],
          );
        },
      ),
    );
  }
}
