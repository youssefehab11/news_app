import 'package:flutter/material.dart';
import 'package:news_app/models/category_dm.dart';

class CategoryDetails extends StatelessWidget {
  final CategoryDM categoryDM;
  const CategoryDetails({
    super.key,
    required this.categoryDM,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(categoryDM.id),
    );
  }
}