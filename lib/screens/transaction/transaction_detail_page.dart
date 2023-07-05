import 'package:expense_pro/core/components/bottom_dialog/remove_transaction_dialog.dart';
import 'package:expense_pro/core/components/buttons/primary_button.dart';
import 'package:expense_pro/core/components/custom/dotted_line.dart';
import 'package:expense_pro/core/components/icons/nav_left_icon.dart';
import 'package:expense_pro/core/components/icons/trash_icon.dart';
import 'package:expense_pro/domain/models/transaction.dart';
import 'package:expense_pro/utils/extenstions/extensions.dart';
import 'package:expense_pro/utils/functions.dart';
import 'package:expense_pro/utils/res/app_assets.dart';
import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionDetailPage extends StatelessWidget {
  const TransactionDetailPage({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transaction.type.index == TransactionType.expense.index
            ? AppColors.red100
            : transaction.type.index == TransactionType.income.index
                ? AppColors.green100
                : AppColors.blue100,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            NavLeft.arrow_left,
            size: 32.0,
            color: AppColors.light100,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppLocalizations.of(context)?.detailTransaction ?? AppText.detailTransaction,
          style: AppTextStyle.titleSmall.copyWith(
            color: AppColors.light100,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              TrashIcon.trash,
              color: AppColors.light100,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                builder: (context) => RemoveTransactionDialog(
                  confirm: () {},
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 240.0,
              child: DetailsTopPart(
                transaction: transaction,
              ),
            ),
            const SizedBox(height: 16.0),
            DottedLine(
              lineLength: 1.sw,
              dashLength: 8.0,
              dashGapLength: 8.0,
              lineThickness: 1.5,
              dashColor: AppColors.light40,
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                bottom: 4.0,
              ),
              child: Text(
                AppLocalizations.of(context)?.description ?? AppText.description,
                style: AppTextStyle.bodyLarge.copyWith(
                  color: AppColors.light20,
                ),
              ),
            ),
            Container(
              height: 140.0,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(
                left: 24.0,
                top: 4.0,
                right: 24.0,
                bottom: 4.0,
              ),
              child: Text(
                transaction.description,
                style: AppTextStyle.bodyLarge,
                overflow: TextOverflow.fade,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                top: 4.0,
              ),
              child: Text(
                AppLocalizations.of(context)?.attachment ?? AppText.attachment,
                style: AppTextStyle.bodyLarge.copyWith(
                  color: AppColors.light20,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(24.0),
              height: .15.sh,
              width: 1.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.black),
              ),
              child: Image.asset(
                AppAssets.avatar,
                height: .15.sh,
                width: 1.sw,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: PrimaryButton(
                onPressed: () {},
                text: AppLocalizations.of(context)?.edit ?? AppText.edit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsTopPart extends StatelessWidget {
  const DetailsTopPart({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250.h,
          padding: const EdgeInsets.only(
            top: 24.0,
            bottom: 32.0,
          ),
          width: 1.sw,
          decoration: BoxDecoration(
            color: transaction.type.index == TransactionType.expense.index
                ? AppColors.red100
                : transaction.type.index == TransactionType.income.index
                    ? AppColors.green100
                    : AppColors.blue100,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ),
          ),
          child: Column(
            children: [
              Text(
                '-\$${transaction.amount.sumFormat() * -1}',
                style: AppTextStyle.headlineLarge.copyWith(
                  color: AppColors.light100,
                ),
              ),
              Text(
                'Buy ${transaction.category?.name}',
                style: AppTextStyle.titleSmall.copyWith(
                  color: AppColors.light100,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                "${transaction.time.day} ${getMonth(transaction.time.month, context)} ${transaction.time.year} ${transaction.time.hour}:${transaction.time.minute}",
                style: AppTextStyle.bodyLarge.copyWith(
                  color: AppColors.light100,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
        Positioned(
          left: 16.0,
          right: 16.0,
          bottom: 0,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)?.type ?? AppText.type,
                        style: AppTextStyle.bodyMedium,
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        transaction.type.name.startWithCapital(),
                        style: AppTextStyle.bodyLarge,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)?.category ?? AppText.category,
                        style: AppTextStyle.bodyMedium,
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        transaction.category?.name ?? ''.startWithCapital(),
                        style: AppTextStyle.bodyLarge,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)?.wallet ?? AppText.wallet,
                        style: AppTextStyle.bodyMedium,
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        transaction.account.accountType.name.startWithCapital(),
                        style: AppTextStyle.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
