import 'package:expense_pro/utils/res/app_text.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LicensePage(
      applicationIcon: Image.asset('assets/wallet.png'),
      applicationName: AppText.appName,
      applicationVersion: '1.0',
    );
  }
}
