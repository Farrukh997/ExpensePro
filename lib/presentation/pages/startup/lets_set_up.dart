import 'package:expense_pro/presentation/components/colorful_button.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LetsSetUpPage extends StatelessWidget {
  const LetsSetUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Let’s setup your\naccount!',
            style: AppTextStyle.titleLarge,
          ),
          Text(
            'Account can be your bank, credit card or your wallet.',
            style: AppTextStyle.regular3,
          ),
          ColorfulButton(
            text: AppLocalizations.of(context)?.letsGo ?? '',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
