import 'package:expense_pro/core/components/buttons/primary_button.dart';
import 'package:expense_pro/core/components/controls/custom_slider.dart';
import 'package:expense_pro/core/components/icons/arrow_down_icon.dart';
import 'package:expense_pro/core/components/icons/nav_left_icon.dart';
import 'package:expense_pro/domain/models/transaction.dart';
import 'package:expense_pro/utils/extenstions/extensions.dart';
import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateBudgetPage extends StatefulWidget {
  const CreateBudgetPage({super.key});

  @override
  State<CreateBudgetPage> createState() => _CreateBudgetPageState();
}

class _CreateBudgetPageState extends State<CreateBudgetPage> {
  var _value = false;

  final double _sliderValue = 0.0;

  // final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.violet100,
        leading: IconButton(
          icon: const Icon(
            NavLeft.arrow_left,
            size: 32.0,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppLocalizations.of(context)?.createBudget ?? AppText.createBudget,
          style: AppTextStyle.titleMedium.copyWith(
            color: AppColors.light100,
          ),
        ),
      ),
      body: ColoredBox(
        color: AppColors.violet100,
        child: Column(
          children: <Widget>[
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(
                left: 24.0,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)?.howMuchSpend ?? AppText.howMuchSpend,
                style: AppTextStyle.bodyLarge.copyWith(
                  color: AppColors.light60,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: TextField(
                textAlign: TextAlign.start,
                keyboardType: const TextInputType.numberWithOptions(
                  signed: false,
                  decimal: true,
                ),
                style: AppTextStyle.headlineLarge.copyWith(
                  color: AppColors.light100,
                ),
                decoration: InputDecoration(
                  prefixIconColor: AppColors.light100,
                  prefixIcon: const Icon(
                    Icons.attach_money,
                    size: 64.0,
                  ),
                  hintText: '0',
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
                      icon: const Icon(
                        ArrowDown.arrow_down,
                      ),
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
                              '',
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
                        onChanged: (value) {
                          // Handle the value change
                          if (kDebugMode) {
                            print('Slider value: $value');
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    PrimaryButton(
                      text: AppLocalizations.of(context)?.contin ?? AppText.contin,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
