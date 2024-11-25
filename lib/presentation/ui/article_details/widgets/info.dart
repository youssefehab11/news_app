import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/date_format.dart';
import 'package:news_app/core/utils/styles_manager.dart';
import 'package:news_app/data/model/article_response/article.dart';

class ArticleInfo extends StatelessWidget {
  final Article article;
  const ArticleInfo({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          article.source?.name ?? '',
          style:
              AppLightStyles.poppinsF14W400.copyWith(color: ColorsManager.gray),
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
    );
  }
}
