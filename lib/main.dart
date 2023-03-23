import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:expense_pro/core/presentation/pages/add_new_wallet.dart';
import 'package:expense_pro/core/presentation/pages/lock.dart';
import 'package:expense_pro/core/presentation/pages/login.dart';
import 'package:expense_pro/core/presentation/pages/onboard.dart';
import 'package:expense_pro/core/presentation/pages/sign_up.dart';
import 'package:expense_pro/core/presentation/pages/verification.dart';
import 'package:expense_pro/core/presentation/res/colors.dart';
import 'package:expense_pro/core/presentation/res/text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:expense_pro/core/presentation/pages/splash.dart';

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
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.light80,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.light80,
          elevation: 0.0,
        ),
        textTheme: const TextTheme(),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: AppColor.violet100,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(
              color: AppColor.violet100,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        buttonTheme: ButtonThemeData(
          minWidth: double.infinity,
          splashColor: AppColor.violet100,
          buttonColor: AppColor.violet100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        primaryColor: AppColor.violet100,
      ),
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
