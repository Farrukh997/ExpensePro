import 'package:expense_pro/core/components/icons/arrow_right_icon.dart';
import 'package:expense_pro/core/components/icons/nav_left_icon.dart';
import 'package:expense_pro/screens/settings/about_page.dart';
import 'package:expense_pro/screens/settings/currency_settings.dart';
import 'package:expense_pro/screens/settings/help_page.dart';
import 'package:expense_pro/screens/settings/language_settings.dart';
import 'package:expense_pro/screens/settings/notifications_settings.dart';
import 'package:expense_pro/screens/settings/security_settings.dart';
import 'package:expense_pro/screens/settings/theme_settings.dart';
import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .3,
        backgroundColor: AppColors.light100,
        leading: IconButton(
          icon: const Icon(
            NavLeft.arrow_left,
            size: 32.0,
            color: AppColors.dark100,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppLocalizations.of(context)?.settings ?? AppText.settings,
          style: AppTextStyle.titleSmallBold,
        ),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const CurrencySettingsPage();
                },
              ));
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)?.currency ?? AppText.currency,
                  style: AppTextStyle.bodyLarge,
                ),
                const Text(AppText.usd),
              ],
            ),
            trailing: const Icon(
              ArrowRight.arrow_right,
              color: AppColors.violet100,
            ),
          ),
          ListTile(
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const LanguageSettingsPage();
                },
              ));
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)?.language ?? AppText.language,
                  style: AppTextStyle.bodyLarge,
                ),
                Text(
                  AppLocalizations.of(context)?.english ?? AppText.english,
                ),
              ],
            ),
            trailing: const Icon(
              ArrowRight.arrow_right,
              color: AppColors.violet100,
            ),
          ),
          ListTile(
            visualDensity: const VisualDensity(horizontal: VisualDensity.minimumDensity),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const ThemeSettingsPage();
                },
              ));
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)?.theme ?? AppText.theme,
                  style: AppTextStyle.bodyLarge,
                ),
                Text(
                  AppLocalizations.of(context)?.dark ?? AppText.dark,
                ),
              ],
            ),
            trailing: const Icon(
              ArrowRight.arrow_right,
              color: AppColors.violet100,
            ),
          ),
          ListTile(
            visualDensity: const VisualDensity(horizontal: VisualDensity.minimumDensity),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const SecuritySettingsPage();
                },
              ));
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)?.security ?? AppText.security,
                  style: AppTextStyle.bodyLarge,
                ),
                Text(
                  AppLocalizations.of(context)?.fingerprint ?? AppText.fingerprint,
                ),
              ],
            ),
            trailing: const Icon(
              ArrowRight.arrow_right,
              color: AppColors.violet100,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const NotificationsSettingsPage();
                },
              ));
            },
            title: Text(
              AppLocalizations.of(context)?.notification ?? AppText.notification,
              style: AppTextStyle.bodyLarge,
            ),
            trailing: const Icon(
              ArrowRight.arrow_right,
              color: AppColors.violet100,
            ),
          ),
          const SizedBox(height: 48.0),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const AboutPage();
                },
              ));
            },
            title: Text(
              AppLocalizations.of(context)?.about ?? AppText.about,
              style: AppTextStyle.bodyLarge,
            ),
            trailing: const Icon(
              ArrowRight.arrow_right,
              color: AppColors.violet100,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const HelpPage();
                },
              ));
            },
            title: Text(
              AppLocalizations.of(context)?.help ?? AppText.help,
              style: AppTextStyle.bodyLarge,
            ),
            trailing: const Icon(
              ArrowRight.arrow_right,
              color: AppColors.violet100,
            ),
          )
        ],
      ),
    );
  }
}
