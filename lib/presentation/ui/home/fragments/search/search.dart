import 'package:flutter/material.dart';
import 'package:news_app/presentation/ui/home/fragments/category_details/widgets/articles_list.dart';

class SearchFragment extends StatelessWidget {
  final String searchInput;
  const SearchFragment({
    super.key,
    required this.searchInput,
  });

  @override
  Widget build(BuildContext context) {
    return ArticlesList(
      inputSearch: searchInput,
    );
  }
}
