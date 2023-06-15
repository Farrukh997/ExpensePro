import 'package:expense_pro/presentation/components/icons/nav_left_icon.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddAccountPage extends StatelessWidget {
  const AddAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue100,
      appBar: AppBar(
        backgroundColor: AppColors.blue100,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            NavLeft.arrow_left,
            size: 32.0,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)?.addNewAccount ?? '',
          style: AppTextStyle.titleSmallBold.copyWith(
            color: AppColors.light100,
          ),
        ),
      ),
      body: Column(
        children: [
          Text(
            AppLocalizations.of(context)?.balance ?? '',
            style: AppTextStyle.titleSmall.copyWith(
              color: AppColors.light100,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
