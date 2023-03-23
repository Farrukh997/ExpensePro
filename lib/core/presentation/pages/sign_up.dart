import 'package:expense_pro/core/presentation/pages/login.dart';
import 'package:expense_pro/core/presentation/res/colors.dart';
import 'package:expense_pro/core/presentation/res/text.dart';
import 'package:expense_pro/core/presentation/res/text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
            color: AppColor.dark100,
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
                  hoverColor: AppColor.violet100,
                  focusColor: AppColor.violet100,
                  hintText: AppText.name,
                  hintStyle: AppTextStyle.regular1.copyWith(
                    color: AppColor.light20,
                    fontWeight: FontWeight.w400,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: const BorderSide(
                      color: AppColor.violet100,
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
                  hintText: AppText.email,
                  hintStyle: AppTextStyle.regular1.copyWith(
                    color: AppColor.light20,
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
                  hintText: AppText.password,
                  hintStyle: AppTextStyle.regular1.copyWith(
                    color: AppColor.light20,
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
                    activeColor: AppColor.violet100,
                    side: const BorderSide(
                      color: AppColor.violet100,
                      width: 3.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: const BorderSide(
                        color: AppColor.violet100,
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
                      text: AppText.termsAndCondition,
                      children: [
                        TextSpan(
                          text: AppText.terms,
                          style: AppTextStyle.regular1.copyWith(
                            color: AppColor.violet100,
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
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                height: size.height * .07,
                minWidth: size.width,
                color: AppColor.violet100,
                child: Text(
                  AppText.signUp,
                  style: AppTextStyle.regular1.copyWith(
                    color: AppColor.light100,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            Text(
              AppText.orWith,
              style: AppTextStyle.regular3.copyWith(
                color: AppColor.light20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: OutlinedButton(
                style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll(AppColor.light100),
                  side: const MaterialStatePropertyAll(BorderSide(
                    color: AppColor.light60,
                    width: 3.0,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  )),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  )),
                  minimumSize: MaterialStatePropertyAll(
                      Size(size.width, size.height * .07)),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/google.svg',
                      height: 32.0,
                      width: 32.0,
                    ),
                    const SizedBox(width: 12.0),
                    Text(
                      AppText.signUpWithGoogle,
                      style: AppTextStyle.regular1.copyWith(
                        color: AppColor.dark50,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                style: AppTextStyle.regular3,
                text: AppText.alreadyHaveAccount,
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: AppText.login,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage())),
                    style: AppTextStyle.regular3.copyWith(
                      color: Colors.transparent,
                      shadows: [
                        const Shadow(
                          color: AppColor.violet100,
                          offset: Offset(0, -1),
                        ),
                      ],
                      decoration: TextDecoration.underline,
                      decorationColor: AppColor.violet100,
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
