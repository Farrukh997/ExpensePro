import 'package:expense_pro/presentation/components/expandable_floating_action.dart';
import 'package:expense_pro/presentation/components/header.dart';
import 'package:expense_pro/presentation/components/transaction.dart';
import 'package:expense_pro/presentation/icons/exchange_icon.dart';
import 'package:expense_pro/presentation/icons/expense_icon.dart';
import 'package:expense_pro/presentation/icons/income_icon.dart';
import 'package:expense_pro/presentation/pages/account/profile.dart';
import 'package:expense_pro/presentation/pages/add/add_expense.dart';
import 'package:expense_pro/presentation/pages/add/add_income.dart';
import 'package:expense_pro/presentation/pages/add/add_transfer.dart';
import 'package:expense_pro/presentation/pages/budget.dart';
import 'package:expense_pro/presentation/pages/notification.dart';
import 'package:expense_pro/presentation/pages/transaction.dart';
import 'package:expense_pro/res/app_assets.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

import '../icons/home_icon.dart';
import '../icons/pie_chart_icon.dart';
import '../icons/transaction_icon.dart';
import '../icons/user_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
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
    'December',
  ];

  List<Color> gradientColors = [
    const Color(0x3d8b50ff),
    AppColors.light100,
  ];

  String _dropDownValue = 'January';

  var _sort = [true, false, false, false];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: [
          buildBody(context, size),
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
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              HomeIcon.home,
              size: 32.0,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              TransactionIcon.transaction,
              size: 32.0,
            ),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              PieChartIcon.pie_chart,
              size: 32.0,
            ),
            label: 'Budget',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              UserIcon.user,
              size: 32.0,
            ),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ExpandableFab(
        distance: 64.0,
        children: [
          ActionButton(
            color: AppColors.red100,
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => const AddExpense())),
            icon: const Icon(
              ExpenseIcon.expense,
              color: AppColors.light100,
            ),
          ),
          ActionButton(
            color: AppColors.blue100,
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => const AddTransfer())),
            icon: const Icon(
              ExchangeIcon.currency_exchange,
              color: AppColors.light100,
            ),
          ),
          ActionButton(
            color: AppColors.green100,
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AddIncome())),
            icon: const Icon(
              IncomeIcon.income,
              color: AppColors.light100,
            ),
          ),
        ],
      ),
    );
  }

  SafeArea buildBody(BuildContext context, Size size) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: true,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFFF6E5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32.0),
                  bottomRight: Radius.circular(32.0),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        child: Image.asset(
                          AppAssets.avatar,
                          height: 48.0,
                          width: 48.0,
                        ),
                      ),
                      SizedBox(
                        height: 36.0,
                        width: 140.0,
                        child: DropdownButtonFormField<String>(
                          // menuMaxHeight: kMinInteractiveDimension,
                          autofocus: false,
                          icon: const SizedBox(
                            width: 0,
                            height: 0,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            filled: false,
                            prefixIcon: const Icon(Icons.keyboard_arrow_down),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: const BorderSide(color: AppColors.light60, width: 2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: const BorderSide(color: AppColors.light60, width: 2.0),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: const BorderSide(color: AppColors.light60, width: 2.0),
                            ),
                          ),
                          value: _dropDownValue,
                          elevation: 8,
                          iconSize: 24.0,
                          isDense: true,
                          isExpanded: false,
                          style: AppTextStyle.tiny,
                          onChanged: (String? value) {
                            if (value != null) {
                              setState(() => _dropDownValue = value);
                            }
                          },
                          items: _monthList
                              .map<DropdownMenuItem<String>>((e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Center(
                                      child: Text(
                                        e,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.notifications,
                          color: AppColors.violet100,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NotificationsPage(),
                              ));
                        },
                      ),
                    ],
                  ),
                  Text(
                    AppLocalizations.of(context)?.accountBalance ?? '',
                    style: AppTextStyle.regular3,
                  ),
                  Text(
                    '\$9400',
                    style: AppTextStyle.title0,
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        color: AppColors.green100,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0)),
                        child: Container(
                          width: 180.0,
                          padding: const EdgeInsets.symmetric(
                            vertical: 24.0,
                            horizontal: 16.0,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(AppAssets.income),
                              const SizedBox(
                                width: 12.0,
                              ),
                              Column(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)?.income ?? '',
                                    style: AppTextStyle.regular1.copyWith(
                                      color: AppColors.light100,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    '\$5000',
                                    style: AppTextStyle.title3.copyWith(
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
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0)),
                        child: Container(
                          width: 180.0,
                          padding: const EdgeInsets.symmetric(
                            vertical: 24.0,
                            horizontal: 16.0,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(AppAssets.outcome),
                              const SizedBox(
                                width: 12.0,
                              ),
                              Column(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)?.expense ?? '',
                                    style: AppTextStyle.regular1.copyWith(
                                      color: AppColors.light100,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    '\$5000',
                                    style: AppTextStyle.title3.copyWith(
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
                style: AppTextStyle.title3,
              ),
            ),
            AspectRatio(
              aspectRatio: 1.7,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: false,
                    drawVerticalLine: false,
                    horizontalInterval: 1,
                    verticalInterval: 1,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: AppColors.blue100,
                        strokeWidth: 1,
                      );
                    },
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        color: AppColors.violet100,
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                        reservedSize: 30,
                        interval: 1,
                        getTitlesWidget: bottomTitleWidgets,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                        interval: 1,
                        getTitlesWidget: leftTitleWidgets,
                        reservedSize: 42,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                    border: Border.all(color: const Color(0xff37434d)),
                  ),
                  minX: 0,
                  maxX: 11,
                  minY: 0,
                  maxY: 6,
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 3),
                        FlSpot(2.6, 2),
                        FlSpot(4.9, 5),
                        FlSpot(6.8, 3.1),
                        FlSpot(8, 4),
                        FlSpot(9.5, 3),
                        FlSpot(11, 4),
                      ],
                      isCurved: true,
                      color: AppColors.violet100,
                      // gradient: LinearGradient(colors: gradientColors),
                      barWidth: 5,
                      isStrokeCapRound: true,
                      dotData: FlDotData(
                        show: false,
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        cutOffY: 0.0,
                        applyCutOffY: true,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
                          stops: const [0.1, 0.8],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Header(
                  onTap: () {
                    _sort = [false, false, false, false];

                    setState(() {
                      _sort[0] = !_sort[0];
                    });
                  },
                  isSelected: _sort[0],
                  title: (AppLocalizations.of(context)?.today ?? ''),
                ),
                Header(
                  onTap: () {
                    _sort = [false, false, false, false];

                    setState(() {
                      _sort[1] = !_sort[1];
                    });
                  },
                  isSelected: _sort[1],
                  title: AppLocalizations.of(context)?.week ?? '',
                ),
                Header(
                  onTap: () {
                    _sort = [false, false, false, false];

                    setState(() {
                      _sort[2] = !_sort[2];
                    });
                  },
                  isSelected: _sort[2],
                  title: AppLocalizations.of(context)?.month ?? '',
                ),
                Header(
                  onTap: () {
                    _sort = [false, false, false, false];
                    setState(() {
                      _sort[3] = !_sort[3];
                    });
                  },
                  isSelected: _sort[3],
                  title: AppLocalizations.of(context)?.year ?? '',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)?.recentTransaction ?? '',
                    style: AppTextStyle.title3,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    decoration: const BoxDecoration(
                      color: AppColors.violet20,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(24.0),
                        right: Radius.circular(24.0),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)?.seeAll ?? '',
                      style: AppTextStyle.regular3.copyWith(
                        color: AppColors.violet100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .7,
              width: size.width,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                itemCount: 5,
                padding: const EdgeInsets.all(24.0),
                itemBuilder: (context, index) => const TransactionItem(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10k';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(
      text,
      style: style,
      textAlign: TextAlign.left,
    );
  }
}
