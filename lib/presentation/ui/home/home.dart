import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/styles_manager.dart';
import 'package:news_app/models/category_dm.dart';
import 'package:news_app/presentation/ui/home/category_details/category_details.dart';
import 'package:news_app/presentation/ui/home/drawer/drawer.dart';
import 'package:news_app/presentation/ui/home/tabs/categories/categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget selectedFragment;
  String appBarTitle = 'News App';

  @override
  initState() {
    super.initState();
    selectedFragment = CategoriesFragment(
      onCategoryItemPressed: onCategoryItemPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AssetsManager.background,
          ),
        ),
        color: ColorsManager.white,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          titleTextStyle: AppLightStyles.exoF22W400,
        ),
        drawer: AppDrawer(
          onDrawerItemPressed: onDrawerItemPressed,
          onCategoryItemPressed: onCategoryItemPressed,
        ),
        body: selectedFragment,
      ),
    );
  }

  void onDrawerItemPressed(Widget widget, String label) {
    setState(() {
      selectedFragment = widget;
      appBarTitle = label;
    });
    Navigator.of(context).pop();
  }

  void onCategoryItemPressed(CategoryDM categoryDM) {
    setState(() {
      selectedFragment = CategoryDetails(categoryDM: categoryDM);
      appBarTitle = categoryDM.title;
    });
  }
}
