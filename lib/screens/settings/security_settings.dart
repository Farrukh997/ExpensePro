import 'package:expense_pro/core/components/icons/nav_left_icon.dart';
import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SecuritySettingsPage extends StatelessWidget {
  const SecuritySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            NavLeft.arrow_left,
            size: 32.0,
            color: AppColors.dark100,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)?.security ?? AppText.security,
          style: AppTextStyle.titleSmallBold,
        ),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {},
            title: Text(
              AppLocalizations.of(context)?.pin ?? AppText.pin,
            ),
          ),
          ListTile(
            onTap: () {},
            title: Text(
              AppLocalizations.of(context)?.fingerprint ?? AppText.fingerprint,
            ),
          ),
          ListTile(
            onTap: () {},
            title: Text(
              AppLocalizations.of(context)?.faceId ?? AppText.faceId,
            ),
          ),
        ],
      ),
    );
  }
}
