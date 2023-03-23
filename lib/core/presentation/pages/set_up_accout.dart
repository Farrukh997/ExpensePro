import 'package:expense_pro/core/presentation/res/colors.dart';
import 'package:expense_pro/core/presentation/res/text.dart';
import 'package:expense_pro/core/presentation/res/text_style.dart';
import 'package:flutter/material.dart';

class SetUpAccount extends StatefulWidget {
  const SetUpAccount({super.key});

  @override
  State<SetUpAccount> createState() => _SetUpAccountState();
}

class _SetUpAccountState extends State<SetUpAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            AppText.letsSetUpAccount,
            style: AppTextStyle.titleLarge,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                color: AppColor.violet100,
                child: Text(AppText.letsGo),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
