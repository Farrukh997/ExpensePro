import 'package:expense_pro/models/account.dart';
import 'package:expense_pro/presentation/components/bottom_sheet/logout_sheet.dart';
import 'package:expense_pro/presentation/components/icons/edit_icon.dart';
import 'package:expense_pro/presentation/components/icons/logout_icon.dart';
import 'package:expense_pro/presentation/components/icons/setting_icon.dart';
import 'package:expense_pro/presentation/components/icons/upload_icon.dart';
import 'package:expense_pro/presentation/components/icons/wallet_icon.dart';
import 'package:expense_pro/presentation/pages/account/account_page.dart';
import 'package:expense_pro/presentation/pages/profile/edit_profile.dart';
import 'package:expense_pro/presentation/pages/settings/export_data_page.dart';
import 'package:expense_pro/presentation/pages/settings/settings_page.dart';
import 'package:expense_pro/presentation/pages/startup/onboard_page.dart';
import 'package:expense_pro/res/app_assets.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:expense_pro/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant ProfilePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ImageProvider getAvatar() {
    if (user?.photoURL != null) {
      return NetworkImage(
        user?.photoURL ?? '',
      );
    }
    return const AssetImage(AppAssets.avatar);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: ColoredBox(
        color: const Color(0xFFF6F6F6),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 64.0,
                left: 24.0,
                right: 24.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.violet100,
                        width: 4.0,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 48.0,
                      backgroundColor: AppColors.blue100,
                      foregroundColor: AppColors.violet100,
                      backgroundImage: getAvatar(),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context)?.username ?? '',
                        style: AppTextStyle.labelLarge.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        FirebaseAuth.instance.currentUser?.displayName ?? '',
                        style: AppTextStyle.titleSmallBold,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileEditPage(),
                            fullscreenDialog: true,
                          ));

                      if (mounted) {
                        setState(() {});
                      }
                    },
                    icon: const Icon(
                      Edit.edit,
                      size: 32.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Card(
              margin: const EdgeInsets.all(24.0),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 8.0,
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 24.0,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AccountPage(
                              account: Account(0, AccountType.bank, 'Bank'),
                            ),
                          ));
                    },
                    leading: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: const Color(0xFFEEE5FF),
                      ),
                      child: const Icon(
                        WalletIcon.wallet,
                        color: AppColors.violet100,
                        size: 32.0,
                      ),
                    ),
                    title: Text(
                      AppLocalizations.of(context)?.account ?? '',
                      style: AppTextStyle.bodyLarge,
                    ),
                  ),
                  const Divider(
                    height: 16.0,
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 24.0,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const SettingsPage();
                        },
                      ));
                    },
                    leading: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: const Color(0xFFEEE5FF),
                      ),
                      child: const Icon(
                        SettingIcon.settings,
                        color: AppColors.violet100,
                        size: 32.0,
                      ),
                    ),
                    title: Text(
                      AppLocalizations.of(context)?.settings ?? '',
                      style: AppTextStyle.bodyLarge,
                    ),
                  ),
                  const Divider(
                    height: 16.0,
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 24.0,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const ExportDataPage();
                        },
                      ));
                    },
                    leading: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: const Color(0xFFEEE5FF),
                      ),
                      child: const Icon(
                        Upload.upload,
                        color: AppColors.violet100,
                        size: 32.0,
                      ),
                    ),
                    title: Text(
                      AppLocalizations.of(context)?.exportData ?? '',
                      style: AppTextStyle.bodyLarge,
                    ),
                  ),
                  const Divider(
                    height: 16.0,
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 24.0,
                    ),
                    onTap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0),
                            ),
                          ),
                          context: context,
                          // showDragHandle: true,
                          builder: (context) => LogoutBottomModalSheet(
                                confirmation: () {
                                  AuthService.instance
                                      .logout()
                                      .then((_) => Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return const OnBoardingPage();
                                              },
                                            ),
                                            ModalRoute.withName('/'),
                                          ));
                                },
                              ));
                    },
                    leading: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: const Color(0xFFFFE2E4),
                      ),
                      child: const Icon(
                        Logout.logout,
                        color: AppColors.red100,
                        size: 32.0,
                      ),
                    ),
                    title: Text(
                      AppLocalizations.of(context)?.logout ?? '',
                      style: AppTextStyle.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
