import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/article_response/article.dart';
import 'package:news_app/data/model/source_response/source.dart';
import 'package:news_app/presentation/ui/home/category_details/widgets/article_item.dart';

class ArticlesList extends StatelessWidget {
  final Source? source;
  final String? inputSearch;
  const ArticlesList({
    super.key,
    this.source,
    this.inputSearch,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getarticlesByScourceId(source?.id, inputSearch),
      builder: (context, snapshot) {
        if (snapshot.hasError || snapshot.data?.status == 'error') {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Article> articles = snapshot.data?.articles ?? [];
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
    );
  }
}
