import 'package:expense_pro/presentation/components/colorful_button.dart';
import 'package:expense_pro/presentation/pages/verification.dart';
import 'package:expense_pro/presentation/utils/mask_text_input_formatter.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/material.dart';
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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          AppLocalizations.of(context)?.login ?? '',
          style: AppTextStyle.title2,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.dark100,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 84.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              child: TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [phoneMask],
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)?.phone ?? '',
                ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: 24.0,
            //     vertical: 12.0,
            //   ),
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //       suffixIcon: IconButton(
            //         icon: Icon(Icons.remove_red_eye),
            //         onPressed: () {},
            //       ),
            //       hintText: AppText.password,
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              child: ColorfulButton(
                text: AppLocalizations.of(context)?.login ?? '',
                onPressed: () {
                  phoneMask.unmaskText(phoneController.text);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const VerificationPage()));
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
            //     children: [
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
