import 'package:expense_pro/models/budget.dart';
import 'package:expense_pro/models/transaction_category.dart';
import 'package:expense_pro/presentation/components/buttons/primary_button.dart';
import 'package:expense_pro/presentation/components/controls/custom_slider.dart';
import 'package:expense_pro/presentation/components/icons/arrow_down_icon.dart';
import 'package:expense_pro/presentation/components/icons/nav_left_icon.dart';
import 'package:expense_pro/presentation/utils/utils.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BudgetEditPage extends StatefulWidget {
  const BudgetEditPage({super.key, required this.budget});

  final Budget budget;

  @override
  State<BudgetEditPage> createState() => _BudgetEditPageState();
}

class _BudgetEditPageState extends State<BudgetEditPage> {
  final textController = TextEditingController();

  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.violet100,
      appBar: AppBar(
        backgroundColor: AppColors.violet100,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            NavLeft.arrow_left,
            size: 32.0,
          ),
        ),
        title: Text(
          'Edit Budget',
          style: AppTextStyle.titleSmallBold.copyWith(
            color: AppColors.light100,
          ),
        ),
      ),
      body: Column(
        children: [
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(
              left: 24.0,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context)?.howMuchSpend ?? '',
              style: AppTextStyle.titleSmallBold.copyWith(
                color: AppColors.light80,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
            ),
            child: TextField(
              textAlign: TextAlign.start,
              keyboardType: const TextInputType.numberWithOptions(
                signed: false,
                decimal: true,
              ),
              controller: textController,
              style: AppTextStyle.headlineLarge.copyWith(
                color: AppColors.light100,
              ),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.attach_money,
                  color: AppColors.light100,
                  size: 64.0,
                ),
                hintText: '00.0',
                hintStyle: AppTextStyle.headlineLarge.copyWith(
                  color: AppColors.light100,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Card(
            color: AppColors.light100,
            margin: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.0),
                topRight: Radius.circular(32.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: <Widget>[
                  DropdownButtonFormField<ExpenseCategory>(
                    icon: const Icon(ArrowDown.arrow_down),
                    iconSize: 24.0,
                    iconDisabledColor: AppColors.light20,
                    iconEnabledColor: AppColors.violet100,
                    items: ExpenseCategory.values
                        .map((e) => DropdownMenuItem<ExpenseCategory>(
                              value: e,
                              child: Text(e.name.startWithCapital()),
                            ))
                        .toList(),
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Receive Alert',
                            style: AppTextStyle.bodyLarge,
                          ),
                          Text(
                            'Receive alert when it reaches some point',
                            style: AppTextStyle.labelLarge.copyWith(
                              fontWeight: FontWeight.normal,
                              color: AppColors.light20,
                            ),
                          ),
                        ],
                      ),
                      CupertinoSwitch(
                        value: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Visibility(
                    visible: _value,
                    child: CustomSlider(
                      value: 0.5,
                      min: 0.0,
                      max: 1.0,
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  PrimaryButton(
                    text: AppLocalizations.of(context)?.contin ?? '',
                    onPressed: () {},
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
