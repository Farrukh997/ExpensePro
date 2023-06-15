import 'package:expense_pro/models/transaction.dart';
import 'package:expense_pro/presentation/components/cards/transaction_card.dart';
import 'package:expense_pro/presentation/components/icons/arrow_down_icon.dart';
import 'package:expense_pro/presentation/components/icons/nav_left_icon.dart';
import 'package:expense_pro/presentation/components/icons/sort_icons.dart';
import 'package:expense_pro/presentation/components/visuals/expense_graph.dart';
import 'package:expense_pro/presentation/utils/utils.dart';
import 'package:expense_pro/res/app_assets.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum Date { week, month, year }

class FinancialReportPage extends StatefulWidget {
  const FinancialReportPage({super.key});

  @override
  State<FinancialReportPage> createState() => _FinancialReportPageState();
}

class _FinancialReportPageState extends State<FinancialReportPage> {
  // var _value;
  List<Transaction> transaction = [];

  List<Color> gradientColors = [
    const Color(0x3d8b50ff),
    AppColors.light100,
  ];

  bool _graphType = false;
  bool _transactionType = false;

  Date? _byDate;

  List<Transaction> getTransactions() {
    List<Transaction> trans = [];
    for (var item in transactions) {
      trans.add(Transaction.fromJson(item));
    }
    return trans;
  }

  void _sortTransactions() {}

  @override
  void initState() {
    transaction = getTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.light100,
      appBar: AppBar(
        backgroundColor: AppColors.light100,
        leading: IconButton(
          icon: const Icon(
            NavLeft.arrow_left,
            size: 32.0,
            color: AppColors.dark100,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppLocalizations.of(context)?.financialReport ?? '',
          style: AppTextStyle.bodyLarge,
        ),
      ),
      body: SingleChildScrollView(
        primary: true,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 48.0,
                    width: 120.0,
                    child: DropdownButtonFormField<Date>(
                      icon: const SizedBox.shrink(),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(ArrowDown.arrow_down),
                        prefixIconColor: AppColors.violet100,
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide: const BorderSide(
                            color: AppColors.light60,
                            width: 1.0,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide: const BorderSide(
                            color: AppColors.light60,
                            width: 1.0,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide: const BorderSide(
                            color: AppColors.red100,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide: const BorderSide(
                            color: AppColors.violet100,
                            width: 1.0,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide: const BorderSide(
                            color: AppColors.light20,
                            width: 1.0,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide: const BorderSide(
                            color: AppColors.red100,
                            width: 1.0,
                          ),
                        ),
                      ),
                      items: Date.values
                          .map<DropdownMenuItem<Date>>((e) => DropdownMenuItem<Date>(
                                value: e,
                                child: Text(
                                  e.name.startWithCapital(),
                                  textAlign: TextAlign.center,
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _byDate = value;
                        });
                      },
                    ),
                  ),
                  GraphicSwitcher(
                    value: _graphType,
                    onChanged: (value) {
                      setState(() {
                        _graphType = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            AspectRatio(
              aspectRatio: 1.7,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 1500),
                // transitionBuilder: (child, animation) {},
                child: _graphType
                    ? PieChart(
                        PieChartData(
                          sections: [
                            PieChartSectionData(
                              radius: 32.0,
                              value: 4.0,
                              color: AppColors.yellow100,
                              borderSide: const BorderSide(
                                color: AppColors.blue100,
                              ),
                            ),
                            PieChartSectionData(
                              value: 9.0,
                            ),
                          ],
                          centerSpaceRadius: 64.0,
                        ),
                      )
                    : ExpenseGraph(
                        gradientColors: gradientColors,
                      ),
              ),
            ),
            TypeSwitcher(
              onChanged: (bool value) {
                setState(() {
                  _transactionType = value;
                });
              },
              value: _transactionType,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Align(
                        alignment: Alignment.center,
                        child: Icon(
                          ArrowDown.arrow_down,
                          color: AppColors.violet100,
                        ),
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        AppLocalizations.of(context)?.transactions ?? '',
                        style: AppTextStyle.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: _sortTransactions,
                    icon: const Icon(
                      Sort.sort,
                      size: 32.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150.h * 3,
              width: 1.sw,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  top: 12.0,
                ),
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return TransactionListItem(item: transaction[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TypeSwitcher extends StatelessWidget {
  const TypeSwitcher({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final ValueChanged<bool> onChanged;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => onChanged(false),
            child: Container(
              height: 64.h,
              width: 0.5.sw - 32,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                color: !value ? AppColors.violet100 : AppColors.light100,
                borderRadius: BorderRadius.circular(32.0),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Text(
                AppLocalizations.of(context)?.expense ?? '',
                style: AppTextStyle.bodyLarge.copyWith(
                  color: !value ? AppColors.light100 : AppColors.dark100,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onChanged(true),
            child: Container(
              height: 64.h,
              width: 0.5.sw - 32,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                color: value ? AppColors.violet100 : AppColors.light100,
                borderRadius: BorderRadius.circular(32.0),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Text(
                AppLocalizations.of(context)?.income ?? '',
                style: AppTextStyle.bodyLarge.copyWith(
                  color: value ? AppColors.light100 : AppColors.dark100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GraphicSwitcher extends StatelessWidget {
  const GraphicSwitcher({
    super.key,
    required this.onChanged,
    required this.value,
  });

  final ValueChanged<bool> onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => onChanged(false),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.light60,
                width: 1.0,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
              color: !value ? AppColors.violet100 : AppColors.light100,
            ),
            child: SvgPicture.asset(
              AppAssets.line_chart,
              color: !value ? AppColors.light100 : AppColors.violet100,
              width: 32.0,
              height: 32.0,
            ),
          ),
        ),
        InkWell(
          onTap: () => onChanged(true),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.light60,
                width: 1.0,
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
              color: value ? AppColors.violet100 : AppColors.light100,
            ),
            child: SvgPicture.asset(
              AppAssets.pie_chart,
              color: value ? AppColors.light100 : AppColors.violet100,
              width: 32.0,
              height: 32.0,
            ),
          ),
        ),
      ],
    );
  }
}
