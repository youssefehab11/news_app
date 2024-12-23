import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/styles_manager.dart';
import 'package:news_app/domain/entity/source_entity.dart';
import 'package:news_app/presentation/ui/home/fragments/category_details/articles/view/articles.dart';
import 'package:news_app/presentation/ui/home/fragments/category_details/sources/widgets/tab_tab_item.dart';

class SourceTabs extends StatefulWidget {
  final List<SourceEntity> sources;
  const SourceTabs({
    super.key,
    required this.sources,
  });

  @override
  State<SourceTabs> createState() => _SourceTabsState();
}

class _SourceTabsState extends State<SourceTabs> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              onSourcePressed(index);
            },
            padding: const EdgeInsets.symmetric(vertical: 8),
            labelPadding: const EdgeInsets.symmetric(horizontal: 8),
            dividerColor: Colors.transparent,
            splashBorderRadius: BorderRadius.circular(25),
            overlayColor:
                const WidgetStatePropertyAll<Color>(Colors.transparent),
            splashFactory: InkRipple.splashFactory,
            tabAlignment: TabAlignment.start,
            labelStyle:
                AppLightStyles.exoF16W400.copyWith(color: ColorsManager.white),
            unselectedLabelStyle:
                AppLightStyles.exoF16W400.copyWith(color: ColorsManager.green),
            isScrollable: true,
            indicator: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(25),
            ),
            tabs: widget.sources
                .map(
                  (source) => TabItem(
                    source: source,
                  ),
                )
                .toList(),
          ),
          Articles(
            sources: widget.sources,
            selectedIndex: selectedIndex,
          ),
        ],
      ),
    );
  }

  void onSourcePressed(int index) {
    if (index != selectedIndex) {
      setState(() {
        selectedIndex = index;
      });
    }
  }
}
