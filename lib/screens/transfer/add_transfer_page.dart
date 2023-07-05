import 'package:expense_pro/core/components/bottom_dialog/attachment_dialog.dart';
import 'package:expense_pro/core/components/buttons/primary_button.dart';
import 'package:expense_pro/core/components/custom/dotted_border/dotted_border.dart';
import 'package:expense_pro/core/components/icons/attachment_icon.dart';
import 'package:expense_pro/core/components/icons/nav_left_icon.dart';
import 'package:expense_pro/core/components/icons/transaction_icon.dart';
import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTransferPage extends StatefulWidget {
  const AddTransferPage({super.key});

  @override
  State<AddTransferPage> createState() => _AddTransferPageState();
}

class _AddTransferPageState extends State<AddTransferPage> {
  final textController = TextEditingController();
  final categoryList = ['Shopping'];
  final walletList = ['Personal'];

  late String selectedCategory;
  late String selectedWallet;

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

  @override
  void initState() {
    super.initState();
    selectedCategory = categoryList.first;
    selectedWallet = walletList.first;
  }

  void _repeatTransactionSwitch(value) {
    setState(() {
      _repeat = value;
    });
  }

  void _addTransfer() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.blue100,
        leading: IconButton(
          icon: const Icon(
            NavLeft.arrow_left,
            size: 32.0,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppLocalizations.of(context)?.transfer ?? AppText.transfer,
          style: AppTextStyle.titleSmallBold.copyWith(
            color: AppColors.light100,
          ),
        ),
      ),
      body: ColoredBox(
        color: AppColors.blue100,
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
                    SizedBox(
                      height: .1.sh,
                      width: 1.sw,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText:
                                        AppLocalizations.of(context)?.to ?? AppText.to,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12.0,
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: AppLocalizations.of(context)?.from ??
                                        AppText.from,
                                    contentPadding: const EdgeInsets.only(
                                      left: 24.0,
                                      top: 24.0,
                                      right: 12,
                                      bottom: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          MaterialButton(
                            height: 48.0,
                            minWidth: 48.0,
                            shape: const CircleBorder(),
                            color: AppColors.light100,
                            padding: const EdgeInsets.all(4.0),
                            onPressed: () {},
                            child: const Icon(
                              TransactionIcon.transaction,
                              color: AppColors.blue100,
                              size: 32.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)?.description ??
                            AppText.description,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
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
                        dashPattern: const <double>[6.0],
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
                                fontWeight: FontWeight.w400,
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
                                AppLocalizations.of(context)?.repeat ?? AppText.repeat,
                                style: AppTextStyle.bodyLarge,
                              ),
                              const SizedBox(
                                height: 6.0,
                              ),
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
                      onPressed: _addTransfer,
                      text: AppLocalizations.of(context)?.contin ?? AppText.contin,
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
