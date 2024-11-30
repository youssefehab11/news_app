import 'package:flutter/material.dart';
import 'package:news_app/domain/entity/source_entity.dart';
import 'package:news_app/presentation/ui/home/fragments/category_details/articles/widgets/articles_list.dart';

class Articles extends StatefulWidget {
  final List<SourceEntity> sources;
  final int selectedIndex;
  const Articles({
    super.key,
    required this.sources,
    required this.selectedIndex,
  });

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ArticlesList(
        source: widget.sources[widget.selectedIndex],
      ),
    );
  }
}
