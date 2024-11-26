import 'package:flutter/material.dart';
import 'package:news_app/models/category_dm.dart';
import 'package:news_app/presentation/ui/home/fragments/category_details/sources/view/sources.dart';

class CategoryDetails extends StatelessWidget {
  final CategoryDM categoryDM;
  const CategoryDetails({
    super.key,
    required this.categoryDM,
  });

  @override
  Widget build(BuildContext context) {
    return Sources(
      categoryId: categoryDM.id,
    );
  }
}
