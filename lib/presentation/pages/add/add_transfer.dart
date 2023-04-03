import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTransfer extends StatefulWidget {
  const AddTransfer({super.key});

  @override
  State<AddTransfer> createState() => _AddTransferState();
}

class _AddTransferState extends State<AddTransfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue100,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text(
          AppLocalizations.of(context)?.transfer ?? '',
          style: AppTextStyle.title3,
        ),
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        color: AppColors.blue100,
        child: Column(
          children: [
            Text(AppLocalizations.of(context)?.howMuch ?? ''),
            TextField(),
            Card(
              child: Column(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
