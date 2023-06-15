import 'package:expense_pro/models/account.dart';
import 'package:expense_pro/presentation/components/buttons/primary_button.dart';
import 'package:expense_pro/presentation/components/icons/nav_left_icon.dart';
import 'package:expense_pro/presentation/components/icons/wallet_icon.dart';
import 'package:expense_pro/presentation/pages/account/account_detail_page.dart';
import 'package:expense_pro/presentation/pages/account/add_account_page.dart';
import 'package:expense_pro/presentation/pages/account/edit_accout_page.dart';
import 'package:expense_pro/res/app_assets.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key, required this.account});

  final Account account;

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  void _editAccount(Account account) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return EditAccountPage(account: account);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Account> accounts = [];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            NavLeft.arrow_left,
            size: 32.0,
            color: AppColors.dark100,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppLocalizations.of(context)?.account ?? '',
          style: AppTextStyle.titleSmall,
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 1.85,
                child: Image.asset(
                  AppAssets.background,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 42.0,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)?.accountBalance ?? '',
                      style: AppTextStyle.bodyLarge.copyWith(
                        color: AppColors.light20,
                      ),
                    ),
                    Text(
                      '${widget.account.balance}',
                      style: AppTextStyle.headlineMedium.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0,
            ),
            onTap: () => _editAccount(widget.account),
            leading: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: const Color(0xffF1F1FA),
              ),
              child: const Icon(
                WalletIcon.wallet,
                size: 32.0,
                color: Color(0xff5233FF),
              ),
            ),
            title: Text(
              AppLocalizations.of(context)?.wallet ?? '',
              style: AppTextStyle.titleSmallBold,
            ),
            trailing: Text(
              '\$${widget.account.balance}',
              style: AppTextStyle.titleSmallBold,
            ),
          ),
          const Divider(),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0,
            ),
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: const Color(0xffF1F1FA),
              ),
              child: SvgPicture.asset(
                'assets/images/chase.svg',
                width: 32.0,
                height: 32.0,
              ),
            ),
            title: Text(
              'Chase',
              style: AppTextStyle.titleSmallBold,
            ),
            trailing: Text(
              '\$1000',
              style: AppTextStyle.titleSmallBold,
            ),
          ),
          const Divider(),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0,
            ),
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 12.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: const Color(0xffF1F1FA),
              ),
              child: SvgPicture.asset(
                'assets/images/citi.svg',
                width: 24.0,
                height: 16.0,
              ),
            ),
            title: Text(
              'Citi',
              style: AppTextStyle.titleSmallBold,
            ),
            trailing: Text(
              '\$6000',
              style: AppTextStyle.titleSmallBold,
            ),
          ),
          const Divider(),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0,
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return AccountEditPage(
                    account: widget.account,
                  );
                },
              ));
            },
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: const Color(0xffF1F1FA),
              ),
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/images/paypal.svg',
                width: 32.0,
                height: 32.0,
              ),
            ),
            title: Text(
              'Paypal',
              style: AppTextStyle.titleSmallBold,
            ),
            trailing: Text(
              '\$2000',
              style: AppTextStyle.titleSmallBold,
            ),
          ),
          const Spacer(),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              bottom: 24.0,
            ),
            child: PrimaryButton(
              text: '+ Add new wallet',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const AddAccountPage();
                  },
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
