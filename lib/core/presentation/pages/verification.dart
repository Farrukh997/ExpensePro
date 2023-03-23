import 'dart:async';

import 'package:expense_pro/core/presentation/components/pin_input.dart';
import 'package:expense_pro/core/presentation/res/colors.dart';
import 'package:expense_pro/core/presentation/res/text.dart';
import 'package:expense_pro/core/presentation/res/text_style.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart' as pinput;
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationPage extends StatefulWidget {
  static const route = '/verification';

  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final List<int> _codeList = [];
  int timer = 3 * 60;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.dark100,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppText.verification,
          style: AppTextStyle.title3,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 24.0,
              top: 72.0,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              AppText.verificationTitle,
              style: AppTextStyle.title0.copyWith(
                color: AppColor.dark100,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 18.0,
              top: 42.0,
              bottom: 42.0,
            ),
            child: PinInputArray(),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 24.0,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              '${timer ~/ 60}:${timer % 60}',
              style: AppTextStyle.title3,
            ),
          ),
        ],
      ),
    );
  }
}
