import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/styles_manager.dart';
import 'package:news_app/data/model/source_response/source.dart';
import 'package:news_app/presentation/ui/home/category_details/widgets/articles_list.dart';

class SourceTabs extends StatefulWidget {
  final List<Source> sources;
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
              onSourceClicked(index);
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
          Expanded(child: ArticlesList(source: widget.sources[selectedIndex])),
        ],
      ),
    );
  }

  void onSourceClicked(int index) {
    if (index != selectedIndex) {
      setState(() {
        selectedIndex = index;
      });
    }
  }
}

class TabItem extends StatelessWidget {
  final Source? source;
  const TabItem({
    super.key,
    this.source,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.green, width: 2),
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(source?.name ?? ''),
    );
  }
}
