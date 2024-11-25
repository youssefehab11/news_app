import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/source_response/source.dart';
import 'package:news_app/models/category_dm.dart';
import 'package:news_app/presentation/ui/home/fragments/category_details/widgets/source_tabs.dart';

class CategoryDetails extends StatelessWidget {
  final CategoryDM categoryDM;
  const CategoryDetails({
    super.key,
    required this.categoryDM,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSourcesByCategoryId(categoryDM.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError || snapshot.data?.status == 'error') {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
        List<Source>? sources = snapshot.data?.sources;
        return SourceTabs(
          sources: sources ?? [],
        );
      },
    );
  }
}
