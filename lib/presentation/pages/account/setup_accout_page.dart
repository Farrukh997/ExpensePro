import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SetUpAccount extends StatefulWidget {
  const SetUpAccount({super.key});

  @override
  State<SetUpAccount> createState() => _SetUpAccountState();
}

class _SetUpAccountState extends State<SetUpAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text(
            AppLocalizations.of(context)?.letsSetUpAccount ?? '',
            style: AppTextStyle.headlineLarge,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                color: AppColors.violet100,
                child: Text(AppLocalizations.of(context)?.letsGo ?? ''),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
