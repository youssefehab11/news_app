import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/models/category_dm.dart';
import 'package:news_app/presentation/ui/home/appbar/appbar.dart';
import 'package:news_app/presentation/ui/home/category_details/category_details.dart';
import 'package:news_app/presentation/ui/home/drawer/drawer.dart';
import 'package:news_app/presentation/ui/home/search/search.dart';
import 'package:news_app/presentation/ui/home/tabs/categories/categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget selectedFragment;
  late TextEditingController searchController;
  String appBarTitle = 'News App';
  double actionIconOpacity = 0;
  bool isSearching = false;
  double drawerIconOpacity = 1;
  CategoryDM? currentCategory;

  @override
  initState() {
    super.initState();
    searchController = TextEditingController();
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
        appBar: MyAppBar(
          drawerIconOpacity: drawerIconOpacity,
          appBarTitle: appBarTitle,
          isSearching: isSearching,
          onSearchSubmitted: onSearchSubmitted,
          actionIconOpacity: actionIconOpacity,
          onActionsIconPressed: onActionsIconPressed,
          onClearIconPressed: onClearIconPressed,
          searchController: searchController,
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
      actionIconOpacity = 0;
      currentCategory = null;
    });
    Navigator.of(context).pop();
  }

  void onCategoryItemPressed(CategoryDM categoryDM) {
    setState(() {
      currentCategory = categoryDM;
      selectedFragment = CategoryDetails(categoryDM: currentCategory!);
      appBarTitle = categoryDM.title;
      actionIconOpacity = 1;
    });
  }

  bool isSearched = false;
  void onActionsIconPressed() {
    if (isSearched) {
      selectedFragment = CategoryDetails(categoryDM: currentCategory!);
      isSearched = false;
    }
    setState(() {
      isSearching = !isSearching;
      searchController.clear();
      drawerIconOpacity = isSearching ? 0 : 1;
    });
  }

  void onClearIconPressed() {
    searchController.clear();
    setState(() {});
  }

  void onSearchSubmitted(String searchInput) {
    if (searchInput.isNotEmpty && searchInput.trim().isNotEmpty) {
      selectedFragment = SearchFragment(
        searchInput: searchInput,
      );
      isSearched = true;
      setState(() {});
    }
  }
}
