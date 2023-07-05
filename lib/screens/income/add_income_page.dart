import 'package:expense_pro/core/components/bottom_dialog/attachment_dialog.dart';
import 'package:expense_pro/core/components/buttons/primary_button.dart';
import 'package:expense_pro/core/components/custom/dotted_border/dotted_border.dart';
import 'package:expense_pro/core/components/icons/arrow_down_icon.dart';
import 'package:expense_pro/core/components/icons/attachment_icon.dart';
import 'package:expense_pro/core/components/icons/nav_left_icon.dart';
import 'package:expense_pro/domain/models/account.dart';
import 'package:expense_pro/domain/models/transaction.dart';
import 'package:expense_pro/utils/extenstions/extensions.dart';
import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddIncomePage extends StatefulWidget {
  const AddIncomePage({super.key});

  @override
  State<AddIncomePage> createState() => _AddIncomePageState();
}

class _AddIncomePageState extends State<AddIncomePage> {
  final textController = TextEditingController();
  final walletList = ['Personal'];

  late IncomeCategory selectedCategory;
  late AccountType accountType;

  var _repeat = false;

  void _showAttachmentBottomModalDialog() => showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        // showDragHandle: true,
        context: context,
        builder: (context) => ChooseAttachment(
          onCamera: () {},
          onDocument: () {},
          onGallery: () {},
        ),
      );

  void _repeatTransactionSwitch(value) {
    setState(() {
      _repeat = value;
    });
  }

  void _addIncome() {}

  @override
  void initState() {
    super.initState();
    accountType = AccountType.bank;
    selectedCategory = IncomeCategory.salary;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.green100,
        leading: IconButton(
          icon: const Icon(
            NavLeft.arrow_left,
            size: 32.0,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppLocalizations.of(context)?.income ?? AppText.income,
          style: AppTextStyle.titleSmallBold.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: ColoredBox(
        color: AppColors.green100,
        child: Column(
          children: <Widget>[
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(
                left: 24.0,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)?.howMuch ?? AppText.howMuch,
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
                    DropdownButtonFormField<IncomeCategory>(
                      icon: const Icon(
                        ArrowDown.arrow_down,
                        size: 32.0,
                        color: AppColors.light20,
                      ),
                      value: selectedCategory,
                      items: IncomeCategory.values
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e.name.startWithCapital(),
                                ),
                              ))
                          .toList(),
                      onChanged: (IncomeCategory? value) {
                        if (value != null) selectedCategory = value;
                      },
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)?.description,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    DropdownButtonFormField<AccountType>(
                      icon: const Icon(
                        ArrowDown.arrow_down,
                        size: 32.0,
                        color: AppColors.light20,
                      ),
                      value: accountType,
                      items: AccountType.values
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.name.startWithCapital()),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) accountType = value;
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
                              AppLocalizations.of(context)?.addAttachment ??
                                  AppText.addAttachment,
                              style: AppTextStyle.bodyLarge.copyWith(
                                color: AppColors.light20,
                                fontWeight: FontWeight.normal,
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
                                AppLocalizations.of(context)?.repeat ?? AppText.repeat,
                                style: AppTextStyle.bodyLarge,
                              ),
                              const SizedBox(height: 6.0),
                              Text(
                                AppLocalizations.of(context)?.repeatTransaction ??
                                    AppText.repeatTransaction,
                                style: AppTextStyle.bodySmall.copyWith(
                                  color: AppColors.light20,
                                ),
                              ),
                            ],
                          ),
                          CupertinoSwitch(
                            value: _repeat,
                            onChanged: _repeatTransactionSwitch,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    PrimaryButton(
                      text: AppLocalizations.of(context)?.contin ?? AppText.contin,
                      onPressed: _addIncome,
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
