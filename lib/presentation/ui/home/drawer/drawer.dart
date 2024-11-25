import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/styles_manager.dart';
import 'package:news_app/presentation/ui/home/fragments/categories/categories.dart';
import 'package:news_app/presentation/ui/home/fragments/categories/widgets/category_item.dart';
import 'package:news_app/presentation/ui/home/fragments/settings/settings.dart';
import 'package:news_app/presentation/ui/home/drawer/widgets/drawer_item.dart';

class AppDrawer extends StatelessWidget {
  final OnDrawerItemPressed onDrawerItemPressed;
  final OnCategoryItemPressed onCategoryItemPressed;
  const AppDrawer({
    super.key,
    required this.onDrawerItemPressed,
    required this.onCategoryItemPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 110.h,
            color: ColorsManager.green,
            child: SafeArea(
              child: Text(
                'News App!',
                style: AppLightStyles.poppinsF24W700
                    .copyWith(color: ColorsManager.white),
              ),
            ),
          ),
          DrawerItem(
            appBarTitle: 'News App',
            label: 'Categories',
            icon: Icons.list,
            onDrawerItemPressed: onDrawerItemPressed,
            fragment: CategoriesFragment(
              onCategoryItemPressed: onCategoryItemPressed,
            ),
          ),
          DrawerItem(
            appBarTitle: 'Settings',
            label: 'Settings',
            icon: Icons.settings,
            onDrawerItemPressed: onDrawerItemPressed,
            fragment: const SettingsFragment(),
          ),
        ],
      ),
    );
  }
}
