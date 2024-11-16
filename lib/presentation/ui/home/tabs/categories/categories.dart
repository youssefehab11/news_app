import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/styles_manager.dart';
import 'package:news_app/models/category_dm.dart';
import 'package:news_app/presentation/ui/home/tabs/categories/widgets/category_item.dart';

class CategoriesFragment extends StatelessWidget {
  CategoriesFragment({
    super.key,
    required this.onCategoryItemPressed,
  });
  final List<CategoryDM> categories = CategoryDM.getAllCategories();
  final OnCategoryItemPressed onCategoryItemPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Pick your category \nof interest',
            style: AppLightStyles.poppinsF22W700.copyWith(
              color: ColorsManager.darkGray,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 4,
            ),
            itemBuilder: (context, index) => CategoryItem(
              categoryDM: categories[index],
              index: index,
              onCategoryItemPressed: onCategoryItemPressed,
            ),
            itemCount: categories.length,
          ),
        ),
      ],
    );
  }
}
