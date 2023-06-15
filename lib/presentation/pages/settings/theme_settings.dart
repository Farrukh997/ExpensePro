import 'package:expense_pro/presentation/components/icons/nav_left_icon.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeSettingsPage extends StatelessWidget {
  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            NavLeft.arrow_left,
            size: 32.0,
            color: AppColors.dark100,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)?.theme ?? '',
          style: AppTextStyle.titleSmallBold,
        ),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            onTap: () {},
            title: Text(
              AppLocalizations.of(context)?.light ?? '',
              style: AppTextStyle.bodyLarge,
            ),
          ),
          ListTile(
            onTap: () {},
            title: Text(
              AppLocalizations.of(context)?.dark ?? '',
              style: AppTextStyle.bodyLarge,
            ),
          ),
          ListTile(
            onTap: () {},
            title: Text(
              AppLocalizations.of(context)?.deviceTheme ?? '',
              style: AppTextStyle.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
