import 'package:flutter/material.dart';
import 'package:news_app/application_view_model.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/styles_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

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
            AppLocalizations.of(context)!.language,
            style: AppLightStyles.poppinsF16W600,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownMenu<String>(
              onSelected: (value) => onLanguageChange(value, context),
              width: double.infinity,
              initialSelection:
                  context.watch<ApplicationViewModel>().currentLanguage == 'en'
                      ? AppLocalizations.of(context)!.english
                      : AppLocalizations.of(context)!.arabic,
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
                  value: AppLocalizations.of(context)!.english,
                  label: AppLocalizations.of(context)!.english,
                ),
                DropdownMenuEntry(
                  value: AppLocalizations.of(context)!.arabic,
                  label: AppLocalizations.of(context)!.arabic,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void onLanguageChange(String? value, BuildContext context) {
    if (value == 'English') {
      context.read<ApplicationViewModel>().changeLanguage('en');
    } else if (value == 'العربية') {
      context.read<ApplicationViewModel>().changeLanguage('ar');
    }
  }
}
