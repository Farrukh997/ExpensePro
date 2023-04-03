import 'dart:core';

import 'package:expense_pro/presentation/utils/mask_text_input_formatter.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.dark100,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0.0,
        title: Text(
          AppLocalizations.of(context)?.forgot ?? '',
          style: AppTextStyle.regular1,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 48.0),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              AppLocalizations.of(context)?.dontWorry ?? '',
              style: AppTextStyle.title2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              keyboardType: TextInputType.phone,
              controller: phoneController,
              inputFormatters: [phoneMask],
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
              height: size.height * .07,
              child: Text(
                AppLocalizations.of(context)?.forgot ?? '',
                style: AppTextStyle.title3.copyWith(
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
