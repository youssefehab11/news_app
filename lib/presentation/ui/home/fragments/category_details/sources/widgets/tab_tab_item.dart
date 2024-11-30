import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/domain/entity/source_entity.dart';

class TabItem extends StatelessWidget {
  final SourceEntity? source;
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
