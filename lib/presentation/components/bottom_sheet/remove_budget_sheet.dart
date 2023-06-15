import 'package:expense_pro/presentation/components/buttons/primary_button.dart';
import 'package:expense_pro/presentation/components/buttons/secondary_button.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RemoveBudgetBottomModalSheet extends StatelessWidget {
  const RemoveBudgetBottomModalSheet({
    super.key,
    required this.confirmation,
  });

  final VoidCallback confirmation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: .27.sh,
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            AppLocalizations.of(context)?.removeBudget ?? '',
            style: AppTextStyle.titleSmallBold,
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            AppLocalizations.of(context)?.usureDeleteBudget ?? '',
            style: AppTextStyle.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SecondaryButton(
                height: .07.sh,
                width: .4.sw,
                text: AppLocalizations.of(context)?.no ?? '',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              PrimaryButton(
                height: .07.sh,
                width: .4.sw,
                text: AppLocalizations.of(context)?.yes ?? '',
                onPressed: confirmation,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
