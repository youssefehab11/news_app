import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/router/routes.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/date_format.dart';
import 'package:news_app/core/utils/styles_manager.dart';
import 'package:news_app/data/model/article_response/article.dart';

class ArticleItem extends StatelessWidget {
  final Article article;
  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => onArticlePressed(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
              ),
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                width: double.infinity,
                height: 230.h,
                fit: BoxFit.cover,
                imageUrl: article.urlToImage ?? '',
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress),
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
      ),
    );
  }

  void onArticlePressed(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.articleDetailsRoute,
      arguments: article,
    );
  }
}
