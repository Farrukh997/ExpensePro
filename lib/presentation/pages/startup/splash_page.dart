import 'dart:ui';

import 'package:expense_pro/presentation/pages/home/home_page.dart';
import 'package:expense_pro/presentation/pages/startup/onboard_page.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text.dart';
import 'package:expense_pro/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  static const route = '/splash';

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      if (AuthService.instance.authStatus()) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return const MainPage();
        }));
      } else {
        return Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const OnBoardingPage()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: AppColors.violet100,
        ),
        height: 1.sh,
        width: 1.sw,
        child: SizedBox(
          height: 100.0,
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Positioned(
                left: 64.0,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 16,
                    sigmaY: 16,
                    tileMode: TileMode.decal,
                  ),
                  child: SizedBox(
                    width: 84.0,
                    height: 84.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        backgroundBlendMode: BlendMode.dstOver,
                        borderRadius: BorderRadius.circular(32.0),
                        color: const Color(0xffd15df7),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                AppText.appName,
                style: AppTextStyle.headlineLarge.copyWith(
                  color: AppColors.light100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
