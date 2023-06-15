import 'package:expense_pro/models/account.dart';
import 'package:expense_pro/models/transaction.dart';
import 'package:expense_pro/presentation/components/buttons/text_button.dart';
import 'package:expense_pro/presentation/components/cards/transaction_card.dart';
import 'package:expense_pro/presentation/components/icons/arrow_down_icon.dart';
import 'package:expense_pro/presentation/components/icons/notification_icon.dart';
import 'package:expense_pro/presentation/pages/account/account_page.dart';
import 'package:expense_pro/presentation/pages/notification/notification_page.dart';
import 'package:expense_pro/presentation/pages/transaction/transaction_detail_page.dart';
import 'package:expense_pro/res/app_assets.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:expense_pro/service/firestore_db.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/visuals/expense_graph.dart';
import 'components/income_expense_indicator.dart';
import 'components/transaction_header_sort.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.seeAll,
  });

  final ValueChanged<int> seeAll;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();

  final List<String> _monthList = [
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

  List<Color> gradientColors = [
    const Color(0x3d8b50ff),
    AppColors.light100,
  ];

  late String _dropDownValue;
  late List<Transaction> data;

  @override
  void initState() {
    _dropDownValue = 'January';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              left: 12.0,
              top: 64.0,
              right: 12.0,
              bottom: 12.0,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFFFFF6E5),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32.0),
                bottomRight: Radius.circular(32.0),
              ),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return AccountPage(
                                account: Account(0, AccountType.bank, 'bank'));
                          },
                        ));
                      },
                      child: CircleAvatar(
                        child: Image.asset(
                          AppAssets.avatar,
                          height: 48.0,
                          width: 48.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 36.0,
                      width: 140.0,
                      child: DropdownButtonFormField<String>(
                        autofocus: false,
                        elevation: 3,
                        icon: const SizedBox(),
                        isDense: true,
                        isExpanded: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          filled: false,
                          prefixIconColor: AppColors.violet100,
                          prefixIcon: const Icon(
                            ArrowDown.arrow_down,
                            size: 24.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: const BorderSide(
                              color: AppColors.light60,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: const BorderSide(
                              color: AppColors.light60,
                              width: 2.0,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: const BorderSide(
                              color: AppColors.light60,
                              width: 2.0,
                            ),
                          ),
                        ),
                        value: _dropDownValue,
                        style: AppTextStyle.labelMedium,
                        onChanged: (String? value) {
                          if (value != null) {
                            setState(() => _dropDownValue = value);
                          }
                        },
                        items: _monthList
                            .map<DropdownMenuItem<String>>(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Center(
                                  child: Text(e, textAlign: TextAlign.center),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        NotificationIcon.notifiaction,
                        color: AppColors.violet100,
                        size: 32.0,
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationsPage(),
                          )),
                    ),
                  ],
                ),
                Text(
                  AppLocalizations.of(context)?.accountBalance ?? '',
                  style: AppTextStyle.bodyMedium,
                ),
                Text(
                  '\$9400',
                  style: AppTextStyle.headlineMedium,
                ),
                const SizedBox(height: 12.0),
                const IncomeAndExpenseIndicator(
                  income: 4000,
                  expese: 5000,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12.0),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(
              left: 24.0,
            ),
            child: Text(
              AppLocalizations.of(context)?.spendFrequency ?? '',
              style: AppTextStyle.titleSmall,
            ),
          ),
          AspectRatio(
            aspectRatio: 1.7,
            child: ExpenseGraph(
              gradientColors: gradientColors,
            ),
          ),
          TransactionHeaderSort(
            transactionChanged: (int value) {
              switch (value) {
                case 0:
                  break;
                case 1:
                  break;
                case 2:
                  break;
                case 3:
                  break;
                default:
                  break;
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)?.recentTransaction ?? '',
                  style: AppTextStyle.titleSmallBold,
                ),
                SimpleButton(
                  onPressed: () => widget.seeAll(one),
                  text: AppLocalizations.of(context)?.seeAll ?? '',
                ),
              ],
            ),
          ),
          StreamBuilder(
            stream: FirestoreDb().getTransactions().snapshots(),
            builder: (_, __) => SizedBox(
              height: .109.sh * data.length + 50,
              width: 1.sw,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                itemCount: data.length,
                padding: const EdgeInsets.all(24.0),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          TransactionDetailPage(transaction: data[index]),
                    ));
                  },
                  child: TransactionListItem(item: data[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
