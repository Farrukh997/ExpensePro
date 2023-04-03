import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:expense_pro/presentation/pages/add_new_wallet.dart';
import 'package:expense_pro/presentation/pages/home.dart';
import 'package:expense_pro/presentation/pages/lock.dart';
import 'package:expense_pro/presentation/pages/login.dart';
import 'package:expense_pro/presentation/pages/notification.dart';
import 'package:expense_pro/presentation/pages/onboard.dart';
import 'package:expense_pro/presentation/pages/sign_up.dart';
import 'package:expense_pro/presentation/pages/verification.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_styles.dart';
import 'package:expense_pro/res/app_text.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:expense_pro/presentation/pages/splash.dart';

import 'presentation/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  runZonedGuarded(
    () => runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ru', 'RU'),
          Locale('uz', 'UZ')
        ],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('en', 'US'),
        child: const MyApp(),
      ),
    ),
    (error, stack) {
      if (kDebugMode) {
        print(error.toString());
      } else {
        // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
        PlatformDispatcher.instance.onError = (error, stack) {
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
          return true;
        };
      }
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppText.appName,
      theme: AppTheme.appTheme,
      routes: <String, WidgetBuilder>{
        SplashPage.route: (context) => const SplashPage(),
        LoginPage.route: (context) => const LoginPage(),
        SignUpPage.route: (context) => const SignUpPage(),
        VerificationPage.route: (context) => const VerificationPage(),
        OnBoardingPage.route: (context) => const OnBoardingPage(),
        LockPage.route: (context) => const LockPage(),
      },
      home: const SplashPage(),
    );
  }
}
