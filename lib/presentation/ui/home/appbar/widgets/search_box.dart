import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/styles_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef OnSearchSubmitted = void Function(String);

class SearchBox extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback onClearIconPressed;
  final OnSearchSubmitted onSearchSubmitted;
  const SearchBox({
    super.key,
    required this.searchController,
    required this.onClearIconPressed,
    required this.onSearchSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: TextField(
        controller: searchController,
        cursorColor: ColorsManager.green,
        onSubmitted: (searchInput) => onSearchSubmitted(searchInput),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: CustomBorder(),
          focusedBorder: CustomBorder(),
          hintText: AppLocalizations.of(context)!.searchHint,
          hintStyle: AppLightStyles.poppinsF14W400
              .copyWith(color: ColorsManager.green),
          prefixIcon: GestureDetector(
            onTap: () => onClearIconPressed(),
            child: const Icon(
              Icons.clear,
              color: ColorsManager.green,
            ),
          ),
          suffixIcon: const Icon(
            Icons.search,
            color: ColorsManager.green,
          ),
        ),
      ),
    );
  }
}

class CustomBorder extends OutlineInputBorder {
  CustomBorder()
      : super(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.transparent),
        );
}
