import 'package:expense_pro/core/components/buttons/primary_button.dart';
import 'package:expense_pro/core/components/buttons/secondary_button.dart';
import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key, required this.confirmation});

  final VoidCallback confirmation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      height: .26.sh,
      child: Column(
        children: [
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
            '${AppLocalizations.of(context)?.logout ?? AppText.logout}?',
            style: AppTextStyle.titleSmallBold,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            AppLocalizations.of(context)?.usureLogout ?? AppText.usureLogout,
            style: AppTextStyle.bodyLargeBold,
          ),
          const SizedBox(
            height: 36.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SecondaryButton(
                height: .07.sh,
                width: .4.sw,
                text: AppLocalizations.of(context)?.no ?? AppText.no,
                onPressed: () => Navigator.pop(context),
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
