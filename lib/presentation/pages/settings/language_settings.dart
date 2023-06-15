import 'package:expense_pro/presentation/components/icons/nav_left_icon.dart';
import 'package:expense_pro/presentation/components/icons/success_icon.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/material.dart';

class LanguageSettingsPage extends StatelessWidget {
  const LanguageSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .3,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            NavLeft.arrow_left,
            size: 32.0,
            color: AppColors.dark100,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)?.language ?? '',
          style: AppTextStyle.titleSmallBold,
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              AppLocalizations.of(context)?.english ?? '',
            ),
            trailing: const Icon(
              SuccessIcon.success,
              color: AppColors.violet100,
            ),
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)?.russian ?? '',
            ),
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)?.uzbek ?? '',
            ),
          ),
        ],
      ),
    );
  }
}
