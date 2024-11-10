import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/styles_manager.dart';

typedef OnDrawerItemPressed = void Function(Widget, String);

class DrawerItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final OnDrawerItemPressed onDrawerItemPressed;
  final String appBarTitle;
  final Widget fragment;
  const DrawerItem({
    super.key,
    required this.label,
    required this.icon,
    required this.onDrawerItemPressed,
    required this.fragment,
    required this.appBarTitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onDrawerItemPressed(fragment, appBarTitle);
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 32,
            ),
            SizedBox(width: 8.w),
            Text(
              label,
              style: AppLightStyles.poppinsF24W700.copyWith(
                color: ColorsManager.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
