import 'package:expense_pro/core/components/buttons/primary_button.dart';
import 'package:expense_pro/core/components/buttons/secondary_button.dart';
import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RemoveBudgetDialog extends StatelessWidget {
  const RemoveBudgetDialog({
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
          Container(
            width: 32.0,
            height: 4.0,
            decoration: BoxDecoration(
              color: AppColors.violet40,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            AppLocalizations.of(context)?.removeBudget ?? AppText.removeBudget,
            style: AppTextStyle.titleSmallBold,
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            AppLocalizations.of(context)?.usureDeleteBudget ?? AppText.usureDeleteBudget,
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
                text: AppLocalizations.of(context)?.no ?? AppText.no,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              PrimaryButton(
                height: .07.sh,
                width: .4.sw,
                text: AppLocalizations.of(context)?.yes ?? AppText.yes,
                onPressed: confirmation,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
