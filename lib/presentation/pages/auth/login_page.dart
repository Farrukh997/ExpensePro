import 'package:expense_pro/presentation/components/buttons/primary_button.dart';
import 'package:expense_pro/presentation/components/icons/nav_left_icon.dart';
import 'package:expense_pro/presentation/pages/auth/verification_page.dart';
import 'package:expense_pro/presentation/utils/input_formatter.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:expense_pro/service/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  static const route = '/login';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final phoneMask = MaskTextInputFormatter(mask: '+998 (##) ###-##-##');
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          AppLocalizations.of(context)?.login ?? '',
          style: AppTextStyle.titleMedium,
        ),
        leading: IconButton(
          icon: const Icon(
            NavLeft.arrow_left,
            size: 32.0,
            color: AppColors.dark100,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 84.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              child: TextFormField(
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Enter the fucking phone';
                  return null;
                },
                controller: phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: <TextInputFormatter>[phoneMask],
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)?.phone ?? '',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              child: PrimaryButton(
                text: AppLocalizations.of(context)?.login ?? '',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    String number = phoneMask.unmaskText(phoneController.text);
                    number = '+998$number';
                    if (kDebugMode) {
                      print(number);
                    }
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => VerificationPage(phoneNumber: number)));
                  }
                },
              ),
            ),
            // TextButton(
            //   onPressed: () => Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => ForgotPasswordPage())),
            //   child: Text(
            //     AppText.forgot,
            //     style: AppTextStyle.title3.copyWith(
            //       color: AppColor.violet100,
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 24.0),
            // RichText(
            //   text: TextSpan(
            //     text: AppText.dontHaveAccount,
            //     style: AppTextStyle.regular1,
            //     children: <Widget>[
            //       const TextSpan(text: ' '),
            //       TextSpan(
            //         recognizer: TapGestureRecognizer()
            //           ..onTap = () => Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => const SignUpPage())),
            //         text: AppText.signUp,
            //         style: AppTextStyle.regular1.copyWith(
            //           color: Colors.transparent,
            //           shadows: [
            //             const Shadow(
            //               color: AppColor.violet100,
            //               offset: Offset(0, -1),
            //             ),
            //           ],
            //           decoration: TextDecoration.underline,
            //           decorationColor: AppColor.violet100,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
