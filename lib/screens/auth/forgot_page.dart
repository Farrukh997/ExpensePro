import 'dart:core';

import 'package:expense_pro/core/components/icons/nav_left_icon.dart';
import 'package:expense_pro/utils/input_formatter.dart';
import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final phoneController = TextEditingController();
  final phoneMask = MaskTextInputFormatter(mask: '+998 (##) ###-##-##');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            NavLeft.arrow_left,
            size: 32.0,
            color: AppColors.dark100,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0.0,
        title: Text(
          AppLocalizations.of(context)?.forgot ?? AppText.forgot,
          style: AppTextStyle.bodyLarge,
        ),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 48.0),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              AppLocalizations.of(context)?.dontWorry ?? AppText.dontWorry,
              style: AppTextStyle.titleMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              keyboardType: TextInputType.phone,
              controller: phoneController,
              inputFormatters: <TextInputFormatter>[phoneMask],
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)?.phone,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: MaterialButton(
              color: AppColors.violet100,
              height: .07.sh,
              child: Text(
                AppLocalizations.of(context)?.forgot ?? AppText.forgot,
                style: AppTextStyle.titleSmallBold.copyWith(
                  color: AppColors.light100,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
