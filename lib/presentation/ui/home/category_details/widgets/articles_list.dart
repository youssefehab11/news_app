import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/date_format.dart';
import 'package:news_app/core/utils/styles_manager.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/article_response/article.dart';
import 'package:news_app/data/model/source_response/source.dart';

class ArticlesList extends StatelessWidget {
  final Source source;
  const ArticlesList({
    super.key,
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getarticlesByScourceId(source.id ?? ''),
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

class ArticleItem extends StatelessWidget {
  final Article article;
  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: CachedNetworkImage(
              width: double.infinity,
              height: 230.h,
              imageUrl: article.urlToImage ?? '',
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child:
                    CircularProgressIndicator(value: downloadProgress.progress),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            article.author ?? '',
            style: AppLightStyles.poppinsF14W400
                .copyWith(color: ColorsManager.gray),
            textAlign: TextAlign.start,
          ),
          Text(
            article.title ?? '',
            style: AppLightStyles.poppinsF16W600
                .copyWith(color: ColorsManager.darkGray),
            textAlign: TextAlign.start,
          ),
          Text(
            article.publishedAt?.formatDate ?? '',
            style: AppLightStyles.poppinsF14W400
                .copyWith(color: ColorsManager.lightGray),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
