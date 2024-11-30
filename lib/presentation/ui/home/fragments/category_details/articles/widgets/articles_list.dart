import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/base/base_ui_state.dart';
import 'package:news_app/core/components/error_widget.dart';
import 'package:news_app/core/components/loading_widget.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/data_source_impl/articles_data_source_impl.dart';
import 'package:news_app/data/repository_impl/articles_repository_impl.dart';
import 'package:news_app/domain/entity/article_entity.dart';
import 'package:news_app/domain/entity/source_entity.dart';
import 'package:news_app/domain/usecases/get_articles_usecase.dart';
import 'package:news_app/presentation/ui/home/fragments/category_details/articles/view_model/articles_view_model.dart';
import 'package:news_app/presentation/ui/home/fragments/category_details/articles/widgets/article_item.dart';
import 'package:provider/provider.dart';

class ArticlesList extends StatefulWidget {
  final SourceEntity? source;
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
    viewModel = ArticlesViewModel(
      usecase: GetArticlesUsecase(
        repository: ArticlesRepositoryImpl(
          articlesDataSource: ArticlesDataSourceImpl(
            apiManager: ApiManager(),
          ),
        ),
      ),
    );
    viewModel.getArticlesBySourceId(
      sourceId: widget.source?.id,
      inputSearch: widget.inputSearch,
    );
  }

  @override
  void didUpdateWidget(covariant ArticlesList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source?.id != widget.source?.id ||
        oldWidget.inputSearch != widget.inputSearch) {
      viewModel.getArticlesBySourceId(
        sourceId: widget.source?.id,
        inputSearch: widget.inputSearch,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<ArticlesViewModel>(
        builder: (context, viewModel, child) {
          BaseUiState<List<ArticleEntity>> state = viewModel.state;
          switch (state) {
            case SuccessState():
              {
                List<ArticleEntity> resultArticles = state.data;
                List<ArticleEntity> articles = [];
                for (ArticleEntity article in resultArticles) {
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
