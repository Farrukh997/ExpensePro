import 'package:expense_pro/presentation/components/buttons/primary_button.dart';
import 'package:expense_pro/presentation/components/buttons/secondary_button.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemoveTransactionBottomModalSheet extends StatelessWidget {
  const RemoveTransactionBottomModalSheet({super.key, required this.confirm});

  final VoidCallback confirm;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      height: .24.sh,
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)?.removeTransaction ?? '',
            style: AppTextStyle.titleSmallBold,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            AppLocalizations.of(context)?.usuredeleteTransaction ?? '',
            style: AppTextStyle.bodyLarge.copyWith(
              color: AppColors.light20,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SecondaryButton(
                width: .4.sw,
                text: AppLocalizations.of(context)?.no ?? '',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              PrimaryButton(
                width: .4.sw,
                text: AppLocalizations.of(context)?.yes ?? '',
                onPressed: confirm,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
