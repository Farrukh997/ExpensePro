import 'package:expense_pro/presentation/components/buttons/primary_button.dart';
import 'package:expense_pro/presentation/components/icons/shopping_icon.dart';
import 'package:expense_pro/presentation/pages/transaction/financial_report_page.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:story/story.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StoryReportPage extends StatefulWidget {
  const StoryReportPage({super.key, required this.period});

  final String period;

  @override
  State<StoryReportPage> createState() => _StoryReportPageState();
}

class _StoryReportPageState extends State<StoryReportPage> {
  late final List<Widget> _stories = [
    Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(
          height: 96.0,
        ),
        Text(
          widget.period,
          style: AppTextStyle.titleSmallBold.copyWith(
            color: AppColors.light100,
          ),
        ),
        const Spacer(),
        Text(
          AppLocalizations.of(context)?.youSpent ?? '',
          style: AppTextStyle.titleLarge.copyWith(
            color: AppColors.light100,
          ),
        ),
        const SizedBox(
          height: 24.0,
        ),
        Text(
          '\$332',
          style: AppTextStyle.headlineLarge.copyWith(
            color: AppColors.light100,
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 300.0,
          width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            margin: const EdgeInsets.all(12.0),
            color: AppColors.light100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'and your biggest\nspending is from',
                  style: AppTextStyle.titleSmall.copyWith(
                    color: AppColors.dark100,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.light20,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: AppColors.yellow20,
                        ),
                        child: const Icon(
                          ShoppingIcon.shopping_bag,
                          color: AppColors.yellow100,
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        'Shopping',
                        style: AppTextStyle.bodyLarge.copyWith(
                          color: AppColors.dark100,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '\$ 120',
                  style: AppTextStyle.headlineMedium.copyWith(
                    color: AppColors.dark100,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 24.0,
        ),
      ],
    ),
    Column(
      children: [
        const SizedBox(
          height: 96.0,
        ),
        Text(
          widget.period,
          style: AppTextStyle.titleSmallBold.copyWith(
            color: AppColors.light100,
          ),
        ),
        const Spacer(),
        Text(
          'You Earned',
          style: AppTextStyle.titleLarge.copyWith(
            color: AppColors.light100,
          ),
        ),
        const SizedBox(
          height: 24.0,
        ),
        Text(
          '\$332',
          style: AppTextStyle.headlineLarge.copyWith(
            color: AppColors.light100,
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 300.0,
          width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            margin: const EdgeInsets.all(12.0),
            color: AppColors.light100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'and your biggest\nincome is from',
                  style: AppTextStyle.titleSmall.copyWith(
                    color: AppColors.dark100,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.light20,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: AppColors.yellow20,
                        ),
                        child: const Icon(
                          ShoppingIcon.shopping_bag,
                          color: AppColors.yellow100,
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        'Shopping',
                        style: AppTextStyle.bodyLarge.copyWith(
                          color: AppColors.dark100,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '\$ 120',
                  style: AppTextStyle.headlineMedium.copyWith(
                    color: AppColors.dark100,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 24.0,
        ),
      ],
    ),
    Column(
      children: [
        const SizedBox(
          height: 96.0,
        ),
        Text(
          widget.period,
          style: AppTextStyle.titleSmallBold.copyWith(
            color: AppColors.light100,
          ),
        ),
        const Spacer(),
        Text(
          '2 of 12 Budget is\nexceeds the limit',
          style: AppTextStyle.titleLarge.copyWith(
            color: AppColors.light100,
          ),
        ),
        const SizedBox(
          height: 24.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: AppColors.light100,
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppColors.yellow20,
                    ),
                    child: const Icon(
                      ShoppingIcon.shopping_bag,
                      color: AppColors.yellow100,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    'Shopping',
                    style: AppTextStyle.titleSmallBold,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8.0),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: AppColors.light100,
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppColors.yellow20,
                    ),
                    child: const Icon(
                      Icons.restaurant,
                      color: AppColors.yellow100,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    'Food',
                    style: AppTextStyle.titleSmallBold,
                  ),
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 128.0),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '“Financial freedom is freedom from fear.”',
                  style: AppTextStyle.titleLarge.copyWith(
                    color: AppColors.light100,
                  ),
                ),
                TextSpan(
                  text: '\n\n-Robert Kiyosaki',
                  style: AppTextStyle.titleMedium.copyWith(
                    color: AppColors.light100,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ];

  final List<Color> _storyColors = [
    AppColors.red100,
    AppColors.green100,
    AppColors.violet100,
    AppColors.violet100
  ];

  @override
  Widget build(BuildContext context) {
    return StoryPageView(
      indicatorDuration: const Duration(seconds: 10),
      showShadow: true,
      indicatorPadding: const EdgeInsets.only(
        top: 64.0,
        left: 8.0,
        right: 8.0,
      ),
      storyLength: (value) {
        if (value > 0) return value;
        return _stories.length;
      },
      pageLength: 1,
      gestureItemBuilder: (context, pageIndex, storyIndex) {
        if (storyIndex == 3) {
          return Stack(
            children: [
              Positioned(
                bottom: 32.0,
                left: 16.0,
                right: 16.0,
                child: PrimaryButton(
                  elevation: 3.0,
                  focusElevation: 4.0,
                  hoverElevation: 6.0,
                  color: AppColors.light100,
                  textColor: AppColors.violet100,
                  text: 'See the full detail',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const FinancialReportPage();
                      },
                    ));
                  },
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
      itemBuilder: (context, pageIndex, storyIndex) => Material(
        color: _storyColors[storyIndex],
        child: _stories[storyIndex],
      ),
    );
  }
}
