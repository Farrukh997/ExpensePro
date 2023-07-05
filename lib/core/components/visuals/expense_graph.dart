import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpenseGraph extends StatelessWidget {
  const ExpenseGraph({
    super.key,
    required this.gradientColors,
  });

  final List<Color> gradientColors;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: false,
          // drawVerticalLine: false,
          // horizontalInterval: 1,
          // verticalInterval: 1,
          // getDrawingHorizontalLine: (value) => FlLine(
          //   color: AppColors.blue100,
          //   strokeWidth: 1,
          // ),
          // getDrawingVerticalLine: (value) => FlLine(
          //   color: AppColors.violet100,
          //   strokeWidth: 1,
          // ),
        ),
        titlesData: FlTitlesData(
          show: false,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: (value, meta) => BottomTitleWidget(
                value: value,
                meta: meta,
              ),
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
              interval: 1,
              getTitlesWidget: (value, meta) => LeftTitleWidget(
                value: value,
                meta: meta,
              ),
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
        lineBarsData: <LineChartBarData>[
          LineChartBarData(
            spots: const <FlSpot>[
              FlSpot(0, 2),
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
                stops: const <double>[0.1, 0.8],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomTitleWidget extends StatelessWidget {
  final double value;
  final TitleMeta meta;

  const BottomTitleWidget({
    Key? key,
    required this.value,
    required this.meta,
  }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return bottomTitleWidgets(value, meta);
  }
}

class LeftTitleWidget extends StatelessWidget {
  final double value;
  final TitleMeta meta;

  const LeftTitleWidget({
    super.key,
    required this.value,
    required this.meta,
  });

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

  @override
  Widget build(BuildContext context) {
    return leftTitleWidgets(value, meta);
  }
}
