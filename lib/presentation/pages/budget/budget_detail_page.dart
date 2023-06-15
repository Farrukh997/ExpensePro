import 'package:expense_pro/models/budget.dart';
import 'package:expense_pro/presentation/components/bottom_sheet/remove_budget_sheet.dart';
import 'package:expense_pro/presentation/components/buttons/primary_button.dart';
import 'package:expense_pro/presentation/components/icons/nav_left_icon.dart';
import 'package:expense_pro/presentation/components/icons/shopping_icon.dart';
import 'package:expense_pro/presentation/components/icons/trash_icon.dart';
import 'package:expense_pro/presentation/components/icons/warning_icon.dart';
import 'package:expense_pro/presentation/pages/budget/budget_edit_page.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BudgetDetailPage extends StatefulWidget {
  const BudgetDetailPage({super.key, required this.budget});

  final Budget budget;

  @override
  State<BudgetDetailPage> createState() => _BudgetDetailPageState();
}

class _BudgetDetailPageState extends State<BudgetDetailPage> {
  late final double remaining = widget.budget.limit - widget.budget.spent;
  double percent = 0.5;

  void _confirmation() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            NavLeft.arrow_left,
            size: 32.0,
            color: AppColors.dark100,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppLocalizations.of(context)?.detailBudget ?? '',
          style: AppTextStyle.titleSmallBold,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                context: context,
                // showDragHandle: true,
                builder: (context) =>
                    RemoveBudgetBottomModalSheet(confirmation: _confirmation),
              );
            },
            icon: const Icon(
              TrashIcon.trash,
              size: 32.0,
              color: AppColors.dark100,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 256.0,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
              top: 72.0,
              bottom: 24.0,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 8.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              border: Border.all(
                color: AppColors.light40,
                width: 1.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(right: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColors.yellow20,
                  ),
                  child: const Icon(
                    ShoppingIcon.shopping_bag,
                    size: 32.0,
                    color: AppColors.yellow100,
                  ),
                ),
                Text(
                  'Shopping',
                  style: AppTextStyle.titleMedium,
                ),
              ],
            ),
          ),
          Text(
            AppLocalizations.of(context)?.remaining ?? '',
            style: AppTextStyle.titleLarge.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 24.0),
          Text(
            '\$${remaining > 0 ? remaining : 0}',
            style: AppTextStyle.headlineLarge,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 42.0,
              vertical: 24.0,
            ),
            child: ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(32.0),
              child: LinearProgressIndicator(
                value: percent,
                minHeight: 8.0,
                backgroundColor: AppColors.light60,
                color: remaining > 0 ? AppColors.blue100 : AppColors.yellow100,
              ),
            ),
          ),
          Container(
            width: 420.w,
            margin: const EdgeInsets.only(top: 24.0),
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 10.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36.0),
              color: AppColors.red100,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  WarningIcon.warning,
                  size: 32.0,
                  color: AppColors.light100,
                ),
                const SizedBox(width: 12.0),
                Text(
                  AppLocalizations.of(context)?.exceedLimit ?? "",
                  style: AppTextStyle.bodyLarge.copyWith(
                    color: AppColors.light100,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                bottom: 24.0,
              ),
              child: PrimaryButton(
                text: AppLocalizations.of(context)?.edit ?? '',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return BudgetEditPage(budget: widget.budget);
                    },
                  ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
