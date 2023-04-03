import 'package:expense_pro/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddIncome extends StatefulWidget {
  const AddIncome({super.key});

  @override
  State<AddIncome> createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text(AppLocalizations.of(context)?.income ?? ''),
      ),
      body: Container(
        color: AppColors.green100,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
