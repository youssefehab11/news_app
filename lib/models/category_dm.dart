import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/constants_manager.dart';

class CategoryDM {
  String id;
  String title;
  String imagePath;
  Color backgroundColor;
  CategoryDM({
    required this.id,
    required this.title,
    required this.backgroundColor,
    required this.imagePath,
  });
  static List<CategoryDM> getAllCategories() {
    return [
      CategoryDM(
        id: ConstantsManager.sportsBackEndId,
        title: 'Sports',
        backgroundColor: ColorsManager.red,
        imagePath: AssetsManager.sports,
      ),
      CategoryDM(
        id: ConstantsManager.generalBackEndId,
        title: 'General',
        backgroundColor: ColorsManager.darkBlue,
        imagePath: AssetsManager.general,
      ),
      CategoryDM(
        id: ConstantsManager.healthBackEndId,
        title: 'Health',
        backgroundColor: ColorsManager.pink,
        imagePath: AssetsManager.health,
      ),
      CategoryDM(
        id: ConstantsManager.businessBackEndId,
        title: 'Business',
        backgroundColor: ColorsManager.lightBrown,
        imagePath: AssetsManager.business,
      ),
      CategoryDM(
        id: ConstantsManager.entertainmentBackEndId,
        title: 'Entertainment',
        backgroundColor: ColorsManager.blue,
        imagePath: AssetsManager.entertainment,
      ),
      CategoryDM(
        id: ConstantsManager.scienceBackEndId,
        title: 'Science',
        backgroundColor: ColorsManager.yellow,
        imagePath: AssetsManager.science,
      ),
      CategoryDM(
        id: ConstantsManager.technologyBackEndId,
        title: 'Technology',
        backgroundColor: ColorsManager.green,
        imagePath: AssetsManager.technology,
      ),
    ];
  }
}
