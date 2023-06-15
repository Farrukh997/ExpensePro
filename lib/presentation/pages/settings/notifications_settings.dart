import 'package:expense_pro/presentation/components/icons/nav_left_icon.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationsSettingsPage extends StatefulWidget {
  const NotificationsSettingsPage({super.key});

  @override
  State<NotificationsSettingsPage> createState() => _NotificationsSettingsPageState();
}

class _NotificationsSettingsPageState extends State<NotificationsSettingsPage> {
  var _value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .3,
        leading: IconButton(
          icon: const Icon(
            NavLeft.arrow_left,
            size: 32.0,
            color: AppColors.dark100,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppLocalizations.of(context)?.notification ?? '',
          style: AppTextStyle.titleSmallBold,
        ),
      ),
      body: Column(
        children: [
          SwitchListTile.adaptive(
            activeColor: AppColors.violet100,
            title: Text(
              'Expense Alert',
              style: AppTextStyle.bodyLargeBold,
            ),
            subtitle: Text(
              'Get notification about your expense',
              style: AppTextStyle.bodyMedium,
            ),
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = !_value;
              });
            },
          ),
          SwitchListTile.adaptive(
            activeColor: AppColors.violet100,
            title: Text(
              'Budget',
              style: AppTextStyle.bodyLargeBold,
            ),
            subtitle: Text(
              'Get notification when your budget exceeding the limit',
              style: AppTextStyle.bodyMedium,
            ),
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = !_value;
              });
            },
          ),
          SwitchListTile.adaptive(
            activeColor: AppColors.violet100,
            title: Text(
              'Tips & Articles',
              style: AppTextStyle.bodyLargeBold,
            ),
            subtitle: Text(
              'Small & useful pieces of pratical financial advice',
              style: AppTextStyle.bodyMedium,
            ),
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = !_value;
              });
            },
          ),
        ],
      ),
    );
  }
}
