import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_pro/models/account.dart';
import 'package:expense_pro/models/transaction_category.dart';
import 'package:expense_pro/models/transaction_type.dart';
import 'package:expense_pro/presentation/components/bottom_sheet/attachment_sheet.dart';
import 'package:expense_pro/presentation/components/buttons/primary_button.dart';
import 'package:expense_pro/presentation/components/custom/dotted_border/dotted_border.dart';
import 'package:expense_pro/presentation/components/icons/arrow_down_icon.dart';
import 'package:expense_pro/presentation/components/icons/attachment_icon.dart';
import 'package:expense_pro/presentation/components/icons/nav_left_icon.dart';
import 'package:expense_pro/presentation/utils/utils.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:expense_pro/models/transaction.dart' as t;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  final textController = TextEditingController();
  late ExpenseCategory selectedCategory;
  late Account account;
  bool _repeat = false;
  double? _expenseValue;

  String description = '';

  void _showAttachmentBottomModalDialog() => showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        // showDragHandle: true,
        context: context,
        builder: (context) => BottomModalDialog(
          onCamera: () {},
          onDocument: () {},
          onGallery: () {},
        ),
      );

  @override
  void initState() {
    super.initState();
    account = Account(0, AccountType.bank, 'Chase');
    selectedCategory = ExpenseCategory.food;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.red100,
        leading: IconButton(
          icon: const Icon(
            NavLeft.arrow_left,
            size: 32.0,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppLocalizations.of(context)?.expense ?? '',
          style: AppTextStyle.titleSmallBold.copyWith(
            color: AppColors.light100,
          ),
        ),
      ),
      body: ColoredBox(
        color: AppColors.red100,
        child: Column(
          children: <Widget>[
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(
                left: 24.0,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)?.howMuch ?? '',
                style: AppTextStyle.titleSmallBold.copyWith(
                  color: AppColors.light100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
              ),
              child: TextField(
                onChanged: (value) => _expenseValue,
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
              margin: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 24.0,
                ),
                child: Column(
                  children: <Widget>[
                    DropdownButtonFormField<ExpenseCategory>(
                      icon: const Icon(
                        ArrowDown.arrow_down,
                        size: 32.0,
                        color: AppColors.light20,
                      ),
                      value: selectedCategory,
                      items: ExpenseCategory.values
                          .map((e) => DropdownMenuItem<ExpenseCategory>(
                                value: e,
                                child: Text(e.name.startWithCapital()),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) selectedCategory = value;
                      },
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      onChanged: (value) => description = value,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)?.description ?? '',
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    DropdownButtonFormField<Account>(
                      icon: const Icon(
                        ArrowDown.arrow_down,
                        size: 32.0,
                      ),
                      iconDisabledColor: AppColors.light20,
                      value: account,
                      items: [
                        DropdownMenuItem(
                          value: Account(0, AccountType.bank, 'chase'),
                          child: Text('asd'),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) account = value;
                      },
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(16.0),
                      onTap: _showAttachmentBottomModalDialog,
                      child: DottedBorder(
                        strokeWidth: 2.0,
                        padding: const EdgeInsets.all(16.0),
                        borderType: BorderType.RRect,
                        strokeCap: StrokeCap.butt,
                        radius: const Radius.circular(16.0),
                        dashPattern: const [6.0],
                        color: AppColors.light60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Attachment.attachment,
                              size: 32.0,
                              color: AppColors.light20,
                            ),
                            Text(
                              AppLocalizations.of(context)?.addAttachment ?? '',
                              style: AppTextStyle.bodyLarge.copyWith(
                                color: AppColors.light20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 24.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context)?.repeat ?? '',
                                style: AppTextStyle.bodyLarge,
                              ),
                              const SizedBox(height: 6.0),
                              Text(
                                AppLocalizations.of(context)?.repeatTransaction ?? '',
                                style: AppTextStyle.bodySmall.copyWith(
                                  color: AppColors.light20,
                                ),
                              ),
                            ],
                          ),
                          CupertinoSwitch(
                            value: _repeat,
                            onChanged: (value) {
                              setState(() => _repeat = value);
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    PrimaryButton(
                      onPressed: () {
                        final transaction = t.Transaction(
                          description: description,
                          type: TransactionType.expense,
                          category: selectedCategory,
                          time: DateTime.now(),
                          amount: _expenseValue ?? 0.0,
                          account: account,
                          attachment: '',
                        );
                        // FirebaseFirestore.instance.collection('transactions').add(app.Transaction());
                        Navigator.pop(context);
                      },
                      text: AppLocalizations.of(context)?.contin ?? '',
                    ),
                    const SizedBox(
                      height: 32.0,
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
