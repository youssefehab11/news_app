import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/styles_manager.dart';

class ArticleContent extends StatelessWidget {
  final String description;
  final VoidCallback onViewArticlePressed;
  const ArticleContent({
    super.key,
    required this.description,
    required this.onViewArticlePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.white,
      margin: REdgeInsets.all(16.0),
      padding: REdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            description,
            style: AppLightStyles.poppinsF14W400.copyWith(
              color: ColorsManager.darkGray,
            ),
          ),
          TextButton(
            onPressed: () => onViewArticlePressed(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'View Full Article',
                  style: AppLightStyles.poppinsF16W600.copyWith(
                    color: ColorsManager.darkGray,
                    fontSize: 15,
                  ),
                ),
                Icon(
                  Icons.arrow_right,
                  color: ColorsManager.darkGray,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
