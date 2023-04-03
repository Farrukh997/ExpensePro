import 'package:expense_pro/presentation/components/colorful_button.dart';
import 'package:expense_pro/presentation/pages/login.dart';
import 'package:expense_pro/res/app_assets.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

class SignUpPage extends StatefulWidget {
  static const route = '/signUp';

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool? _check = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Sign Up',
          style: AppTextStyle.title3,
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
            const SizedBox(height: 64.0),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 24.0,
                bottom: 12.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hoverColor: AppColors.violet100,
                  focusColor: AppColors.violet100,
                  hintText: AppLocalizations.of(context)?.name,
                  hintStyle: AppTextStyle.regular1.copyWith(
                    color: AppColors.light20,
                    fontWeight: FontWeight.w400,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: const BorderSide(
                      color: AppColors.violet100,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)?.email ?? '',
                  hintStyle: AppTextStyle.regular1.copyWith(
                    color: AppColors.light20,
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.remove_red_eye,
                    ),
                    onPressed: () {},
                  ),
                  hintText: AppLocalizations.of(context)?.password,
                  hintStyle: AppTextStyle.regular1.copyWith(
                    color: AppColors.light20,
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    activeColor: AppColors.violet100,
                    side: const BorderSide(
                      color: AppColors.violet100,
                      width: 3.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: const BorderSide(
                        color: AppColors.violet100,
                        width: 4.0,
                      ),
                    ),
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    value: _check,
                    onChanged: (value) {
                      setState(() => _check = value);
                    },
                  ),
                  const SizedBox(width: 12.0),
                  RichText(
                    strutStyle: const StrutStyle(),
                    text: TextSpan(
                      style: AppTextStyle.regular1,
                      text: AppLocalizations.of(context)?.termsAndCondition,
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(context)?.terms,
                          style: AppTextStyle.regular1.copyWith(
                            color: AppColors.violet100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ColorfulButton(
                text: AppLocalizations.of(context)?.signUp ?? '',
                onPressed: () {},
              ),
            ),
            Text(
              AppLocalizations.of(context)?.orWith ?? '',
              style: AppTextStyle.regular3.copyWith(
                color: AppColors.light20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(AppColors.light100),
                  side: const MaterialStatePropertyAll(BorderSide(
                    color: AppColors.light60,
                    width: 3.0,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  )),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  )),
                  minimumSize: MaterialStatePropertyAll(Size(size.width, size.height * .07)),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.google,
                      height: 32.0,
                      width: 32.0,
                    ),
                    const SizedBox(width: 12.0),
                    Text(
                      AppLocalizations.of(context)?.signUpWithGoogle ?? '',
                      style: AppTextStyle.regular1.copyWith(
                        color: AppColors.dark50,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                style: AppTextStyle.regular3,
                text: AppLocalizations.of(context)?.alreadyHaveAccount,
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: AppLocalizations.of(context)?.login,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const LoginPage())),
                    style: AppTextStyle.regular3.copyWith(
                      color: Colors.transparent,
                      shadows: [
                        const Shadow(
                          color: AppColors.violet100,
                          offset: Offset(0, -1),
                        ),
                      ],
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.violet100,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
