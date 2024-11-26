import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/styles_manager.dart';
import 'package:news_app/models/category_dm.dart';
import 'package:news_app/presentation/ui/home/fragments/categories/widgets/category_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesFragment extends StatefulWidget {
  const CategoriesFragment({
    super.key,
    required this.onCategoryItemPressed,
  });
  final OnCategoryItemPressed onCategoryItemPressed;

  @override
  State<CategoriesFragment> createState() => _CategoriesFragmentState();
}

class _CategoriesFragmentState extends State<CategoriesFragment> {
  late List<CategoryDM> categories;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    categories = CategoryDM.getAllCategories(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AppLocalizations.of(context)!.pickCategoryLabel,
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
              onCategoryItemPressed: widget.onCategoryItemPressed,
            ),
            itemCount: categories.length,
          ),
        ),
      ],
    );
  }
}
