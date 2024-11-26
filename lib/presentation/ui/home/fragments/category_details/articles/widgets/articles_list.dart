import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/components/error_widget.dart';
import 'package:news_app/core/components/loading_widget.dart';
import 'package:news_app/data/model/article_response/article.dart';
import 'package:news_app/data/model/source_response/source.dart';
import 'package:news_app/presentation/ui/home/fragments/category_details/articles/view_model/articles_view_model.dart';
import 'package:news_app/presentation/ui/home/fragments/category_details/articles/widgets/article_item.dart';
import 'package:provider/provider.dart';

class ArticlesList extends StatefulWidget {
  final Source? source;
  final String? inputSearch;
  const ArticlesList({
    super.key,
    this.source,
    this.inputSearch,
  });

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  late ArticlesViewModel viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = ArticlesViewModel();
    viewModel.getArticlesBySourceId(widget.source?.id, widget.inputSearch);
  }

  @override
  void didUpdateWidget(covariant ArticlesList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source?.id != widget.source?.id ||
        oldWidget.inputSearch != widget.inputSearch) {
      viewModel.getArticlesBySourceId(widget.source?.id, widget.inputSearch);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<ArticlesViewModel>(
        builder: (context, value, child) {
          if (viewModel.isLoading) {
            return LoadingWidget();
          }
          if (viewModel.errorMessage != null) {
            return AppErrorWidget(errorMessage: viewModel.errorMessage!);
          }
          List<Article> resultArticles = viewModel.articles ?? [];
          List<Article> articles = [];
          for (Article article in resultArticles) {
            if (article.title != '[Removed]') {
              articles.add(article);
            }
          }
          if (articles.isEmpty) {
            return Center(
              child: Text('No articles to show...'),
            );
          }
          return ListView.separated(
            itemBuilder: (context, index) {
              return ArticleItem(
                article: articles[index],
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              height: 10.h,
            ),
            itemCount: articles.length,
          );
        },
      ),
    );
  }
}
