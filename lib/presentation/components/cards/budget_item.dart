import 'package:expense_pro/models/budget.dart';
import 'package:expense_pro/presentation/components/icons/warning_icon.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BudgetItem extends StatelessWidget {
  const BudgetItem({super.key, required this.budget});

  final Budget budget;

  @override
  Widget build(BuildContext context) {
    final double remaining = budget.limit - budget.spent;
    final double percent = budget.spent / budget.limit;
    return Container(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: AppColors.light100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 8.0,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.light60,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 24.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: remaining > 0 ? AppColors.blue100 : AppColors.yellow100,
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Text(
                      budget.category.name,
                      style: AppTextStyle.bodyLarge,
                    ),
                  ],
                ),
              ),
              if (remaining <= 0)
                const Icon(
                  WarningIcon.warning,
                  size: 32.0,
                  color: AppColors.red100,
                ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            '${AppLocalizations.of(context)?.remaining ?? ''} \$${remaining >= 0 ? remaining.toInt() : 0}',
            style: AppTextStyle.titleSmallBold,
          ),
          const SizedBox(height: 8.0),
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(32.0),
            child: LinearProgressIndicator(
              value: percent,
              minHeight: 8.0,
              backgroundColor: AppColors.light60,
              color: remaining > 0 ? AppColors.blue100 : AppColors.yellow100,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            '\$${budget.spent.toInt()} of \$${budget.limit.toInt()}',
            style: AppTextStyle.bodyLarge.copyWith(
              color: AppColors.light20,
            ),
          ),
          if (remaining <= 0) ...[
            const SizedBox(height: 4.0),
            Text(
              AppLocalizations.of(context)?.exceedLimit ?? '',
              style: AppTextStyle.labelLarge.copyWith(
                color: AppColors.red100,
              ),
            ),
          ]
        ],
      ),
    );
  }
}
