import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/constants_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  static List<CategoryDM> getAllCategories(BuildContext context) {
    return [
      CategoryDM(
        id: ConstantsManager.sportsBackEndId,
        title: AppLocalizations.of(context)!.sports,
        backgroundColor: ColorsManager.red,
        imagePath: AssetsManager.sports,
      ),
      CategoryDM(
        id: ConstantsManager.generalBackEndId,
        title: AppLocalizations.of(context)!.general,
        backgroundColor: ColorsManager.darkBlue,
        imagePath: AssetsManager.general,
      ),
      CategoryDM(
        id: ConstantsManager.healthBackEndId,
        title: AppLocalizations.of(context)!.health,
        backgroundColor: ColorsManager.pink,
        imagePath: AssetsManager.health,
      ),
      CategoryDM(
        id: ConstantsManager.businessBackEndId,
        title: AppLocalizations.of(context)!.business,
        backgroundColor: ColorsManager.lightBrown,
        imagePath: AssetsManager.business,
      ),
      CategoryDM(
        id: ConstantsManager.entertainmentBackEndId,
        title: AppLocalizations.of(context)!.entertainment,
        backgroundColor: ColorsManager.blue,
        imagePath: AssetsManager.entertainment,
      ),
      CategoryDM(
        id: ConstantsManager.scienceBackEndId,
        title: AppLocalizations.of(context)!.science,
        backgroundColor: ColorsManager.yellow,
        imagePath: AssetsManager.science,
      ),
      CategoryDM(
        id: ConstantsManager.technologyBackEndId,
        title: AppLocalizations.of(context)!.technology,
        backgroundColor: ColorsManager.green,
        imagePath: AssetsManager.technology,
      ),
    ];
  }
}
