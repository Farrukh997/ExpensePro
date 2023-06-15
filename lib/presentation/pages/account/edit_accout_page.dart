import 'package:expense_pro/models/account.dart';
import 'package:expense_pro/presentation/components/bottom_sheet/remove_transaction_sheet.dart';
import 'package:expense_pro/presentation/components/buttons/primary_button.dart';
import 'package:expense_pro/presentation/components/icons/nav_left_icon.dart';
import 'package:expense_pro/presentation/components/icons/trash_icon.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({super.key, required this.account});

  final Account account;

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue100,
      appBar: AppBar(
        backgroundColor: AppColors.blue100,
        leading: IconButton(
          icon: const Icon(
            NavLeft.arrow_left,
            size: 32.0,
            color: AppColors.light100,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppLocalizations.of(context)?.editAccount ?? '',
          style: AppTextStyle.titleSmallBold.copyWith(
            color: AppColors.light100,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _removeThisAccount(),
            icon: const Icon(
              TrashIcon.trash,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(
              left: 24.0,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context)?.balance ?? '',
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            margin: EdgeInsets.zero,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    top: 24.0,
                    bottom: 8.0,
                  ),
                  child: TextFormField(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    top: 8.0,
                    right: 16.0,
                    bottom: 24.0,
                  ),
                  child: DropdownButtonFormField<String>(
                    items: const <DropdownMenuItem<String>>[
                      // DropdownMenuItem(child: )
                    ],
                    onChanged: (String? value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: PrimaryButton(
                    text: AppLocalizations.of(context)?.contin ?? '',
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _removeThisAccount() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return RemoveTransactionBottomModalSheet(
          confirm: () {},
        );
      },
    );
  }
}
