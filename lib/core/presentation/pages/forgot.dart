import 'package:expense_pro/core/presentation/res/colors.dart';
import 'package:expense_pro/core/presentation/res/text.dart';
import 'package:expense_pro/core/presentation/res/text_style.dart';
import 'package:expense_pro/core/presentation/utils/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'dart:core';

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
            color: AppColor.dark100,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0.0,
        title: Text(
          AppText.forgot,
          style: AppTextStyle.regular1,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 48.0),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              AppText.dontWorry,
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
                hintText: AppText.phone,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: MaterialButton(
              color: AppColor.violet100,
              height: size.height * .07,
              child: Text(
                AppText.contin,
                style: AppTextStyle.title3.copyWith(
                  color: AppColor.light100,
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
