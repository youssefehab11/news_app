import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/styles_manager.dart';
import 'package:news_app/presentation/ui/home/appbar/widgets/search_box.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  final bool isSearching;
  final VoidCallback onActionsIconPressed;
  final VoidCallback onClearIconPressed;
  final TextEditingController searchController;
  final double actionIconOpacity;
  final double drawerIconOpacity;
  final OnSearchSubmitted onSearchSubmitted;
  const MyAppBar({
    super.key,
    required this.appBarTitle,
    required this.isSearching,
    required this.onActionsIconPressed,
    required this.onClearIconPressed,
    required this.searchController,
    required this.actionIconOpacity,
    required this.drawerIconOpacity,
    required this.onSearchSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: drawerIconOpacity,
        child: IconButton(
          disabledColor: ColorsManager.white,
          onPressed: drawerIconOpacity == 0
              ? null
              : () => Scaffold.of(context).openDrawer(),
          icon: const Icon(Icons.menu),
        ),
      ),
      title: AnimatedSwitcher(
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            alignment: Alignment.centerRight,
            child: child,
          );
        },
        duration: const Duration(milliseconds: 500),
        child: isSearching
            ? SearchBox(
                searchController: searchController,
                onClearIconPressed: onClearIconPressed,
                onSearchSubmitted: onSearchSubmitted,
              )
            : Text(appBarTitle),
      ),
      titleTextStyle: AppLightStyles.exoF22W400,
      actions: [
        AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: actionIconOpacity,
          child: IconButton(
            disabledColor: ColorsManager.white,
            onPressed:
                actionIconOpacity == 0 ? null : () => onActionsIconPressed(),
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              child: isSearching
                  ? const Icon(
                      Icons.close,
                      key: ValueKey<int>(1),
                    )
                  : const Icon(
                      Icons.search,
                      key: ValueKey<int>(2),
                    ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
