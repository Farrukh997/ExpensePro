import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_pro/presentation/pages/auth/lock_page.dart';
import 'package:expense_pro/presentation/pages/auth/login_page.dart';
import 'package:expense_pro/presentation/pages/startup/onboard_page.dart';
import 'package:expense_pro/presentation/pages/auth/sign_up_page.dart';
import 'package:expense_pro/presentation/pages/startup/splash_page.dart';
import 'package:expense_pro/presentation/pages/auth/verification_page.dart';
import 'package:expense_pro/res/app_styles.dart';
import 'package:expense_pro/res/app_text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> onMessage(RemoteMessage message) async {
  var db = FirebaseFirestore.instance;
  db.collection('notifications').add(message.data);
}

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      FirebaseMessaging.onBackgroundMessage(onMessage);
      FlutterError.onError = (errorDetails) {
        // Pass all uncaught "fatal" errors from the framework to Crashlytics
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      };
      runApp(const MyApp());
    },
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
    return ScreenUtilInit(
      designSize: const Size(640, 1136),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: true,
        title: AppText.appName,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppTheme.appTheme,
        routes: <String, WidgetBuilder>{
          SplashPage.route: (context) => const SplashPage(),
          LoginPage.route: (context) => const LoginPage(),
          SignUpPage.route: (context) => const SignUpPage(),
          OnBoardingPage.route: (context) => const OnBoardingPage(),
          LockPage.route: (context) => const LockPage(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == VerificationPage.route) {
            return MaterialPageRoute(
              builder: (context) =>
                  VerificationPage(phoneNumber: settings.arguments as String),
            );
          }
          return null;
        },
        home: child,
      ),
      child: const SplashPage(),
    );
  }
}
