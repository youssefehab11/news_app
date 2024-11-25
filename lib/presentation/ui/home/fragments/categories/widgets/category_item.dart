import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/styles_manager.dart';
import 'package:news_app/models/category_dm.dart';

typedef OnCategoryItemPressed = void Function(CategoryDM);

class CategoryItem extends StatelessWidget {
  final CategoryDM categoryDM;
  final int index;
  final OnCategoryItemPressed onCategoryItemPressed;
  const CategoryItem({
    super.key,
    required this.categoryDM,
    required this.onCategoryItemPressed,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: getBorder(),
        color: categoryDM.backgroundColor,
      ),
      child: InkWell(
        onTap: () => onCategoryItemPressed(categoryDM),
        borderRadius: getBorder(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              categoryDM.imagePath,
              height: 126.h,
              width: 142.w,
            ),
            Text(
              categoryDM.title,
              style: AppLightStyles.exoF22W400,
            ),
          ],
        ),
      ),
    );
  }

  BorderRadius getBorder() {
    return BorderRadius.only(
      topLeft: Radius.circular(25.r),
      topRight: Radius.circular(25.r),
      bottomLeft: Radius.circular(index.isEven ? 25.r : 0),
      bottomRight: Radius.circular(index.isEven ? 0 : 25.r),
    );
  }
}
