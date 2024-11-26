import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/styles_manager.dart';

class SettingsFragment extends StatelessWidget {
  const SettingsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Language',
            style: AppLightStyles.poppinsF16W600,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownMenu<String>(
              onSelected: (value) => onLanguageChange(value),
              width: double.infinity,
              initialSelection: 'English',
              textStyle: AppLightStyles.poppinsF14W400
                  .copyWith(color: ColorsManager.green, fontSize: 16),
              trailingIcon: Icon(
                Icons.keyboard_arrow_down,
                color: ColorsManager.green,
              ),
              selectedTrailingIcon: Icon(
                Icons.keyboard_arrow_up,
                color: ColorsManager.green,
              ),
              inputDecorationTheme: InputDecorationTheme(
                fillColor: ColorsManager.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsManager.green),
                ),
              ),
              dropdownMenuEntries: [
                DropdownMenuEntry(
                  value: 'English',
                  label: 'English',
                ),
                DropdownMenuEntry(value: 'Arabic', label: 'العربية'),
              ],
            ),
          )
        ],
      ),
    );
  }

  void onLanguageChange(String? value) {}
}
