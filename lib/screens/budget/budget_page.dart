import 'package:expense_pro/core/components/buttons/primary_button.dart';
import 'package:expense_pro/core/components/cards/budget_card.dart';
import 'package:expense_pro/core/components/icons/arrow_left_icon.dart';
import 'package:expense_pro/core/components/icons/arrow_right_icon.dart';
import 'package:expense_pro/domain/models/budget.dart';
import 'package:expense_pro/domain/models/transaction.dart';
import 'package:expense_pro/screens/budget/budget_detail_page.dart';
import 'package:expense_pro/screens/budget/create_budget_page.dart';
import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  int _currentMonth = 4;
  List<String> month = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  List<Budget> budget = <Budget>[
    Budget(
      category: ExpenseCategory.shopping,
      limit: 1000.0,
      spent: 1000,
      alert: true,
      alertLevel: 0.7,
    ),
    Budget(
      category: ExpenseCategory.shopping,
      limit: 1000.0,
      spent: 1200,
      alert: false,
      alertLevel: 0.4,
    ),
    Budget(
      category: ExpenseCategory.transportation,
      limit: 750.0,
      spent: 350.0,
      alert: false,
      alertLevel: 0.3,
    ),
  ];

  void _createBudget() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CreateBudgetPage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(
                top: 24.0,
                left: 24.0,
                right: 24.0,
              ),
              height: 200.0,
              decoration: const BoxDecoration(
                color: AppColors.violet100,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      if (_currentMonth > 0) {
                        setState(() {
                          _currentMonth--;
                        });
                      }
                    },
                    icon: const Icon(
                      ArrowLeft.arrow_left,
                      color: AppColors.light100,
                      size: 32.0,
                    ),
                  ),
                  Text(
                    month[_currentMonth].toString(),
                    style: AppTextStyle.titleLarge.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.light100,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (_currentMonth < 11) {
                        setState(() {
                          _currentMonth++;
                        });
                      }
                    },
                    icon: const Icon(
                      ArrowRight.arrow_right,
                      color: AppColors.light100,
                      size: 32.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(24.0),
              height: .7.sh,
              width: 1.sw,
              decoration: const BoxDecoration(
                color: AppColors.light60,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: budget.isEmpty
                        ? Center(
                            child: Text(
                              AppLocalizations.of(context)?.letsMakeBudget ??
                                  AppText.letsMakeBudget,
                              style: AppTextStyle.bodySmall.copyWith(
                                color: AppColors.light20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: budget.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return BudgetDetailPage(budget: budget[index]);
                                    },
                                  ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: BudgetItem(budget: budget[index]),
                                ),
                              );
                            },
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: PrimaryButton(
                      onPressed: _createBudget,
                      text: AppLocalizations.of(context)?.createBudget ??
                          AppText.createBudget,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
