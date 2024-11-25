import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class MainBachground extends StatelessWidget {
  final Widget scaffold;
  const MainBachground({
    super.key,
    required this.scaffold,
  });

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
      child: scaffold,
    );
  }
}
