import 'package:api_mock/app/app_cubit.dart';
import 'package:api_mock/core/enums.dart';
import 'package:api_mock/core/l10n/generated/l10n.dart';
import 'package:api_mock/core/theme/text_styles_data.dart';
import 'package:api_mock/features/settings_page/cubit/settings_cubit.dart';
import 'package:api_mock/features/settings_page/widgets/language_pill.dart';
import 'package:api_mock/utils/call_simple_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageSection extends StatefulWidget {
  const LanguageSection({
    super.key,
  });

  @override
  State<LanguageSection> createState() => _LanguageSectionState();
}

class _LanguageSectionState extends State<LanguageSection> {
  bool isEnglishSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.current.selectYourLanguage,
          style: TextStyleData.languageTitle,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LanguagePill(
              label: AppLocalizations.current.portuguese,
              isSelected: !isEnglishSelected,
              onTap: !isEnglishSelected
                  ? () {}
                  : () => _callConfirmationDialog(
                        context,
                        AppLocalizations.current.portuguese,
                        onConfirm: () => _onConfirm(Language.pt),
                      ),
            ),
            LanguagePill(
              label: AppLocalizations.current.english,
              isSelected: isEnglishSelected,
              onTap: isEnglishSelected
                  ? () {}
                  : () => _callConfirmationDialog(
                        context,
                        AppLocalizations.current.english,
                        onConfirm: () => _onConfirm(Language.en),
                      ),
            ),
          ],
        ),
      ],
    );
  }

  Future<dynamic> _callConfirmationDialog(BuildContext context, String language,
          {required VoidCallback onConfirm}) =>
      callSimpleDisplayDialog(
        context,
        content: Text(
          AppLocalizations.current.setLanguageConfimation(language),
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
              onPressed: onConfirm,
              child: Text(
                AppLocalizations.current.yes,
                textAlign: TextAlign.center,
                style: TextStyleData.listItemTitle,
              )),
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(AppLocalizations.current.no)),
        ],
      );

  void _onConfirm(Language language) {
    Navigator.pop(context);
    setState(() => isEnglishSelected = !isEnglishSelected);
    context.read<AppCubit>().onSwitchLanguage(language);
    context.read<SettingsCubit>().onSwitchLanguage();
    context.read<AppCubit>().navigatePage(2);
  }
}
