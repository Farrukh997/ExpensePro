import 'dart:async';

import 'package:logging/logging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_pro/core/theme/app_styles.dart';
import 'package:expense_pro/screens/account/setup_accout_page.dart';
import 'package:expense_pro/screens/auth/lock_page.dart';
import 'package:expense_pro/screens/auth/login_page.dart';
import 'package:expense_pro/screens/startup/onboard_page.dart';
import 'package:expense_pro/screens/auth/sign_up_page.dart';
import 'package:expense_pro/screens/startup/splash_page.dart';
import 'package:expense_pro/screens/auth/verification_page.dart';
import 'package:expense_pro/utils/res/app_text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

Future<void> onMessage(RemoteMessage message) async {
  FirebaseFirestore.instance.collection('notifications').add(message.data);
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
      runApp(MyApp());
    },
    (error, stack) {
      Logger.root.level = Level.ALL; // defaults to Level.INFO
      Logger.root.onRecord.listen((record) {
        if (kDebugMode) {
          print('${record.level.name}: ${record.time}: ${record.message}');
        }
      });

      // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };
    },
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    // refreshListenable: ,
    initialLocation: '/',
    redirect: (context, state) {
      if (state.path == '/') {
        context.push('/onboard');
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/onboard',
        builder: (context, state) => const OnBoardingPage(),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(640, 1136),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
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
        routerConfig: _router,
      ),
      child: const SplashPage(),
    );
  }
}
