import 'package:expense_pro/core/components/buttons/primary_button.dart';
import 'package:expense_pro/core/components/icons/nav_left_icon.dart';
import 'package:expense_pro/utils/res/app_assets.dart';
import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddAccountPage extends StatefulWidget {
  const AddAccountPage({super.key});

  @override
  State<AddAccountPage> createState() => _AddAccountPageState();
}

class _AddAccountPageState extends State<AddAccountPage> {
  final TextEditingController _textController = TextEditingController();
  bool _showSucess = false;
  double _expenseValue = 0.0;

  Widget success() {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.success,
            height: 128.0,
            width: 128.0,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            AppText.yourset,
            style: AppTextStyle.titleSmallBold,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _showSucess
        ? success()
        : Scaffold(
            backgroundColor: AppColors.violet100,
            appBar: AppBar(
              backgroundColor: AppColors.violet100,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  NavLeft.arrow_left,
                  size: 32.0,
                  color: AppColors.light100,
                ),
              ),
              title: Text(
                AppLocalizations.of(context)?.addNewAccount ?? AppText.addNewAccount,
                style: AppTextStyle.titleSmallBold.copyWith(
                  color: AppColors.light100,
                ),
              ),
            ),
            body: Column(
              children: [
                const Spacer(),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    AppLocalizations.of(context)?.balance ?? AppText.balance,
                    style: AppTextStyle.titleSmall.copyWith(
                      color: AppColors.light100,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12.0,
                  ),
                  child: TextField(
                    onChanged: (value) => _expenseValue = double.parse(value),
                    textAlign: TextAlign.start,
                    keyboardType: const TextInputType.numberWithOptions(
                      signed: false,
                      decimal: true,
                    ),
                    // keyboardAppearance: Brightness.dark,
                    textInputAction: TextInputAction.done,
                    controller: _textController,
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
                  margin: EdgeInsets.zero,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(
                        24.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        DropdownButtonFormField<String>(
                          items: ['Cash', 'Bank']
                              .map((e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        PrimaryButton(
                          text: AppLocalizations.of(context)?.contin ?? AppText.contin,
                          onPressed: () {
                            setState(() {
                              _showSucess = true;
                            });
                          },
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
