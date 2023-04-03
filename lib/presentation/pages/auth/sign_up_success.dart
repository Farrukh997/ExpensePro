import 'package:expense_pro/res/app_assets.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

class SignUpSuccessPage extends StatefulWidget {
  const SignUpSuccessPage({super.key});

  @override
  State<SignUpSuccessPage> createState() => _SignUpSuccessPageState();
}

class _SignUpSuccessPageState extends State<SignUpSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SvgPicture.asset(AppAssets.success),
            const SizedBox(height: 12.0),
            Text(
              AppLocalizations.of(context)?.yourset ?? '',
              style: AppTextStyle.title3,
            )
          ],
        ),
      ),
    );
  }
}
