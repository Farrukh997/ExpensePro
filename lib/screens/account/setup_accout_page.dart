import 'package:expense_pro/core/components/buttons/primary_button.dart';
import 'package:expense_pro/screens/account/add_account_page.dart';
import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
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
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 96.0,
              bottom: 24.0,
            ),
            child: Text(
              AppLocalizations.of(context)?.letsSetUpAccount ?? AppText.letsSetUpAccount,
              style: AppTextStyle.headlineSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'Account can be your bank, credit card or your wallet.',
              style: AppTextStyle.bodyLarge,
            ),
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(24.0),
                alignment: Alignment.bottomCenter,
                child: PrimaryButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddAccountPage(),
                        ));
                  },
                  text: AppLocalizations.of(context)?.letsGo ?? AppText.letsGo,
                )),
          ),
        ],
      ),
    );
  }
}
