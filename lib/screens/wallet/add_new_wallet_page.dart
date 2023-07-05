import 'package:expense_pro/core/components/buttons/primary_button.dart';
import 'package:expense_pro/core/components/icons/arrow_down_icon.dart';
import 'package:expense_pro/core/components/icons/nav_left_icon.dart';
import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewAccountPage extends StatefulWidget {
  const AddNewAccountPage({super.key});

  @override
  State<AddNewAccountPage> createState() => _AddNewAccountPageState();
}

class _AddNewAccountPageState extends State<AddNewAccountPage> {
  List<String> list = ['Bank', 'Cash'];
  late String dropdownValue;
  final textController = TextEditingController(text: '\$00.0');
  final nameController = TextEditingController();

  @override
  void initState() {
    dropdownValue = list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.violet100,
      appBar: AppBar(
        backgroundColor: AppColors.violet100,
        leading: IconButton(
          icon: const Icon(
            NavLeft.arrow_left,
            size: 32.0,
            color: AppColors.light100,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppLocalizations.of(context)?.addNewWallet ?? AppText.addNewWallet,
          style: AppTextStyle.titleSmallBold.copyWith(
            color: AppColors.light100,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(
              left: 24.0,
            ),
            child: Text(
              AppLocalizations.of(context)?.balance ?? AppText.balance,
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
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)?.name ?? AppText.name,
                    ),
                    keyboardType: TextInputType.text,
                    controller: nameController,
                  ),
                ),
                Container(
                  height: 84.h,
                  width: 1.sw,
                  padding: const EdgeInsets.all(12.0),
                  child: DropdownButtonFormField<String>(
                    // borderRadius: BorderRadius.circular(16.0),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    value: dropdownValue,
                    icon: const Icon(
                      ArrowDown.arrow_down,
                      color: AppColors.light20,
                      size: 32.0,
                    ),
                    elevation: 16,
                    style: const TextStyle(
                      color: Colors.deepPurple,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        if (value != null) dropdownValue = value;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: PrimaryButton(
                    text: AppLocalizations.of(context)?.contin ?? AppText.contin,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
