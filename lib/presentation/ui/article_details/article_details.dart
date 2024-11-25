import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/components/main_background.dart';
import 'package:news_app/core/utils/styles_manager.dart';
import 'package:news_app/data/model/article_response/article.dart';
import 'package:news_app/presentation/ui/article_details/widgets/content.dart';
import 'package:news_app/presentation/ui/article_details/widgets/image.dart';
import 'package:news_app/presentation/ui/article_details/widgets/info.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetails extends StatelessWidget {
  final Article article;
  const ArticleDetails({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return MainBachground(
      scaffold: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            article.title ?? '',
            style: AppLightStyles.exoF22W400,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 30.h,
              ),
              ArticleImage(
                imagePath: article.urlToImage,
              ),
              ArticleInfo(article: article),
              ArticleContent(
                description: article.description ?? '',
                onViewArticlePressed: onViewArticlePressed,
              )
            ],
          ),
        ),
      ),
    );
  }

  void onViewArticlePressed() async {
    Uri url = Uri.parse(article.url ?? '');
    bool canLaunch = await checkCanLaunch(url);
    if (canLaunch) {
      launchArticle(url);
    }
  }

  Future<bool> checkCanLaunch(Uri uri) async {
    return await canLaunchUrl(uri);
  }

  void launchArticle(Uri uri) async {
    await launchUrl(uri);
  }
}
