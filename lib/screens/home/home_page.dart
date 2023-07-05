import 'package:expense_pro/core/components/buttons/expandable_floating_action.dart';
import 'package:expense_pro/core/components/icons/exchange_icon.dart';
import 'package:expense_pro/core/components/icons/expense_icon.dart';
import 'package:expense_pro/core/components/icons/home_icon.dart';
import 'package:expense_pro/core/components/icons/income_icon.dart';
import 'package:expense_pro/core/components/icons/pie_chart_icon.dart';
import 'package:expense_pro/core/components/icons/transaction_icon.dart';
import 'package:expense_pro/core/components/icons/user_icon.dart';
import 'package:expense_pro/screens/profile/profile_page.dart';
import 'package:expense_pro/screens/expense/add_expense_page.dart';
import 'package:expense_pro/screens/income/add_income_page.dart';
import 'package:expense_pro/screens/transfer/add_transfer_page.dart';
import 'package:expense_pro/screens/budget/budget_page.dart';
import 'package:expense_pro/screens/home/home_body.dart';
import 'package:expense_pro/screens/transaction/transaction_page.dart';
import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: <Widget>[
          HomePage(
            seeAll: (index) {
              setState(() {
                _index = index;
              });
            },
          ),
          const TransactionPage(),
          const BudgetPage(),
          const ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        currentIndex: _index,
        onTap: (value) {
          setState(() => _index = value);
        },
        type: BottomNavigationBarType.fixed,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(
              HomeIcon.home,
              size: 32.0,
            ),
            label: AppLocalizations.of(context)?.home ?? AppText.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              TransactionIcon.transaction,
              size: 32.0,
            ),
            label: AppLocalizations.of(context)?.transactions ?? AppText.transactions,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              PieChartIcon.pie_chart,
              size: 32.0,
            ),
            label: AppLocalizations.of(context)?.budget ?? AppText.budget,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              UserIcon.user,
              size: 32.0,
            ),
            label: AppLocalizations.of(context)?.profile ?? AppText.profile,
          ),
        ],
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ExpandableFab(
        distance: 64.0,
        children: <Widget>[
          ActionButton(
            color: AppColors.red100,
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => const AddExpensePage())),
            icon: const Icon(
              ExpenseIcon.expense,
              color: AppColors.light100,
            ),
          ),
          ActionButton(
            color: AppColors.blue100,
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddTransferPage())),
            icon: const Icon(
              ExchangeIcon.currency_exchange,
              color: AppColors.light100,
            ),
          ),
          ActionButton(
            color: AppColors.green100,
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => const AddIncomePage())),
            icon: const Icon(
              IncomeIcon.income,
              color: AppColors.light100,
            ),
          ),
        ],
      ),
    );
  }
}
