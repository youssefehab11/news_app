import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleImage extends StatelessWidget {
  final String? imagePath;
  const ArticleImage({
    super.key,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: REdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
      ),
      width: double.infinity,
      height: 230.h,
      child: imagePath != null
          ? Image.network(
              imagePath!,
              fit: BoxFit.cover,
            )
          : Icon(Icons.error),
    );
  }
}
