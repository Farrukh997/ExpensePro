import 'dart:async';

import 'package:expense_pro/presentation/components/colorful_button.dart';
import 'package:expense_pro/presentation/components/pin_input.dart';
import 'package:expense_pro/presentation/pages/home.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VerificationPage extends StatefulWidget {
  static const route = '/verification';

  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final List<int> _codeList = [];
  late Timer _timer;
  int seconds = 3 * 60;

  @override
  void initState() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (seconds > 0) {
          setState(() => seconds--);
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minutesStr = (seconds ~/ 60).toString().padLeft(2, '0');
    final secondsStr = (seconds % 60).toString().padLeft(2, '0');
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.dark100,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppLocalizations.of(context)?.verification ?? '',
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
              AppLocalizations.of(context)?.verificationTitle??'',
              style: AppTextStyle.title0.copyWith(
                color: AppColors.dark100,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(
              left: 18.0,
              top: 42.0,
              bottom: 42.0,
            ),
            child: const PinInputArray(),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(
              left: 24.0,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              '$minutesStr:$secondsStr',
              style: AppTextStyle.title3,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 12.0,
            ),
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () {},
                text: AppLocalizations.of(context)?.iDidntReceive??'',
                style: AppTextStyle.regular1.copyWith(
                  color: AppColors.violet100,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              bottom: 48.0,
              top: 24.0,
            ),
            child: ColorfulButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HomePage(),
                    ));
              },
              text: AppLocalizations.of(context)?.verify??'',
            ),
          ),
        ],
      ),
    );
  }
}
