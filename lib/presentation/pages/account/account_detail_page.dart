import 'package:expense_pro/models/account.dart';
import 'package:expense_pro/models/transaction.dart';
import 'package:expense_pro/presentation/components/cards/transaction_card.dart';
import 'package:expense_pro/presentation/components/icons/edit_icon.dart';
import 'package:expense_pro/presentation/components/icons/nav_left_icon.dart';
import 'package:expense_pro/presentation/pages/account/edit_accout_page.dart';
import 'package:expense_pro/presentation/utils/utils.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grouped_list/grouped_list.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountEditPage extends StatelessWidget {
  const AccountEditPage({super.key, required this.account});

  final Account account;

  List<Transaction> getTransactions() {
    List<Transaction> transactionList = [];
    for (var element in transactions) {
      transactionList.add(Transaction.fromJson(element));
    }
    return transactionList;
  }

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
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppLocalizations.of(context)?.detailAccount ?? '',
          style: AppTextStyle.titleSmallBold,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return EditAccountPage(account: account);
                },
              ));
            },
            icon: const Icon(
              Edit.edit,
              size: 32.0,
              color: AppColors.dark100,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F1FA),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: SvgPicture.asset(
              'assets/images/paypal.svg',
              width: 32.0,
              height: 32.0,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            account.accountTitle,
            style: AppTextStyle.bodyLarge,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            '${account.balance}',
            style: AppTextStyle.titleLarge,
          ),
          const SizedBox(height: 12.0),
          Expanded(
            child: GroupedListView(
              padding: const EdgeInsets.only(
                left: 24.0,
                top: 16.0,
                right: 24.0,
              ),
              itemBuilder: (context, Transaction item) {
                return TransactionListItem(item: item);
              },
              groupHeaderBuilder: (Transaction element) => Text(
                '${getMonth(element.time.month, context)} ${element.time.day} ${element.time.year}',
                style: AppTextStyle.bodyLarge,
              ),
              elements: getTransactions(),
              groupBy: (Transaction element) {
                return element.time;
              },
            ),
          ),
        ],
      ),
    );
  }
}
