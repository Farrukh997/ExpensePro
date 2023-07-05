import 'package:expense_pro/utils/res/app_assets.dart';
import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IncomeAndExpenseIndicator extends StatelessWidget {
  const IncomeAndExpenseIndicator({
    super.key,
    required this.income,
    required this.expese,
  });

  final int income, expese;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Card(
          color: AppColors.green100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.0),
          ),
          child: Container(
            width: 280.w,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              vertical: 24.h,
              horizontal: 12.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  AppAssets.income,
                  height: 48.0,
                  width: 48.0,
                ),
                const SizedBox(width: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context)?.income ?? AppText.income,
                      style: AppTextStyle.bodySmall.copyWith(
                        color: AppColors.light100,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      '\$$income',
                      style: AppTextStyle.titleMedium.copyWith(
                        color: AppColors.light100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          color: AppColors.red100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.0),
          ),
          child: Container(
            width: 280.w,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              vertical: 24.h,
              horizontal: 12.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  AppAssets.outcome,
                  height: 48.0,
                  width: 48.0,
                ),
                const SizedBox(width: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context)?.expense ?? AppText.expense,
                      style: AppTextStyle.bodySmall.copyWith(
                        color: AppColors.light100,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      '\$$expese',
                      style: AppTextStyle.titleMedium.copyWith(
                        color: AppColors.light100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
