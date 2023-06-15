import 'dart:async';

import 'package:expense_pro/presentation/components/buttons/primary_button.dart';
import 'package:expense_pro/presentation/components/icons/nav_left_icon.dart';
import 'package:expense_pro/presentation/pages/home/home_page.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:expense_pro/service/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:pinput/pinput.dart';

class VerificationPage extends StatefulWidget {
  static const route = '/verification';

  const VerificationPage({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final _smsOtpController = TextEditingController();
  final timeout = 120;
  late String phoneNumber;
  late int seconds = timeout;
  late Timer _timer;
  late String sms;

  @override
  void initState() {
    super.initState();
    phoneNumber = widget.phoneNumber;
    sms = '';
    AuthService.instance.verifyPhoneNumber(
      phoneNumber,
      timeout: timeout,
      controller: _smsOtpController,
    );
    _timer = Timer(
      Duration(seconds: timeout),
      () {
        if (seconds > 0) {
          setState(() => seconds--);
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minutesStr = (seconds ~/ 60).toString().padLeft(2, '0');
    final secondsStr = (seconds % 60).toString().padLeft(2, '0');
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            NavLeft.arrow_left,
            size: 32.0,
            color: AppColors.dark100,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppLocalizations.of(context)?.verification ?? '',
          style: AppTextStyle.titleSmallBold,
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              bottom: 32.0,
            ),
            child: Text(
              AppLocalizations.of(context)?.verificationTitle ?? '',
              style: AppTextStyle.headlineSmall.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 32.0,
              bottom: 42.0,
            ),
            child: Pinput(
              controller: _smsOtpController,
              onChanged: (value) {
                sms = value;
                if (kDebugMode) {
                  print('onChanged: $value');
                }
              },
              onCompleted: (value) {
                sms = value;
                if (kDebugMode) {
                  print('onComplete: $value');
                }
              },
              onSubmitted: (value) {
                if (kDebugMode) {
                  print('onSubmitted: $value');
                }
                sms = value;
              },
              androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
              closeKeyboardWhenCompleted: true,
              useNativeKeyboard: true,
              keyboardType: TextInputType.text,
              submittedPinTheme: PinTheme(
                height: 48.0,
                width: 48.0,
                decoration: const BoxDecoration(
                  color: AppColors.light100,
                ),
                textStyle: AppTextStyle.titleLarge,
              ),
              defaultPinTheme: PinTheme(
                width: 32.0,
                height: 32.0,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0E2E9),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                textStyle: AppTextStyle.bodyLarge,
              ),
              length: 6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
            ),
            child: Text(
              '$minutesStr:$secondsStr',
              style: AppTextStyle.titleSmallBold.copyWith(
                color: AppColors.violet100,
              ),
            ),
          ),
          Container(
            width: 0.9.sw,
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 12.0,
              bottom: 12.0,
            ),
            child: Text(
              '${AppLocalizations.of(context)?.verificationSmsSent} $phoneNumber',
              style: AppTextStyle.bodyLargeBold.copyWith(
                color: AppColors.dark100,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 12.0,
              bottom: 12.0,
            ),
            child: RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await AuthService.instance.verifyPhoneNumber(
                      phoneNumber,
                      timeout: timeout,
                      controller: _smsOtpController,
                    );
                  },
                text: AppLocalizations.of(context)?.iDidntReceive ?? '',
                style: AppTextStyle.bodyLarge.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.violet100,
                  shadows: [
                    const Shadow(
                      color: AppColors.violet100,
                      offset: Offset(0, -1),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: PrimaryButton(
              onPressed: () {
                AuthService.instance.phoneLogIn(sms).then(
                      (value) => value == AuthStatus.authorized
                          ? Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const MainPage()))
                          : null,
                    );
              },
              text: AppLocalizations.of(context)?.verify ?? '',
            ),
          ),
        ],
      ),
    );
  }
}
