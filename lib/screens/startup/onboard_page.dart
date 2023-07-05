import 'package:expense_pro/core/components/buttons/primary_button.dart';
import 'package:expense_pro/core/components/buttons/secondary_button.dart';
import 'package:expense_pro/screens/home/home_page.dart';
import 'package:expense_pro/screens/auth/login_page.dart';
import 'package:expense_pro/service/auth_service.dart';
import 'package:expense_pro/utils/res/app_assets.dart';
import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingPage extends StatefulWidget {
  static const route = '/onboard';

  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final pageNum = 3;
  int _index = 0;

  _indicator(bool selected) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      duration: const Duration(milliseconds: 500),
      height: selected ? 16.0 : 8.0,
      width: selected ? 16.0 : 8.0,
      decoration: BoxDecoration(
        color: selected ? AppColors.violet100 : AppColors.violet20,
        shape: BoxShape.circle,
      ),
    );
  }

  List<Widget> _buildPageIndicator(int currentIndex, int numPages) {
    List<Widget> indicatorList = [];
    for (int i = 0; i < numPages; i++) {
      indicatorList.add(i == currentIndex ? _indicator(true) : _indicator(false));
    }
    return indicatorList;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          PageView(
            allowImplicitScrolling: true,
            onPageChanged: (index) {
              setState(() => _index = index);
            },
            children: const <Widget>[
              FirstSlide(),
              SecondSlide(),
              ThirdSlide(),
            ],
          ),
          Positioned(
            bottom: 48.0,
            left: 0.0,
            right: 0.0,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 36.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(_index, pageNum),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: PrimaryButton(
                    textColor: AppColors.light100,
                    text: AppLocalizations.of(context)?.login ?? AppText.login,
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SecondaryButton(
                    text: AppLocalizations.of(context)?.skip ?? AppText.skip,
                    onPressed: () {
                      AuthService.instance.signInAnon().then((value) {
                        if (value == AuthStatus.authorized) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainPage(),
                            ),
                          );
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FirstSlide extends StatelessWidget {
  const FirstSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
            top: 128.0,
            right: 12.0,
            bottom: 32.0,
          ),
          child: SvgPicture.asset(
            AppAssets.control,
            height: .3.sh,
            width: 1.sw,
            fit: BoxFit.cover,
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            top: 32.0,
            right: 24.0,
            bottom: 12.0,
          ),
          child: Text(
            AppLocalizations.of(context)?.onBoardText1 ?? AppText.onBoardText1,
            style: AppTextStyle.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            top: 8.0,
            right: 24.0,
          ),
          child: Text(
            AppLocalizations.of(context)?.onBoardDesc1 ?? AppText.onBoardDesc1,
            style: AppTextStyle.bodyLarge.copyWith(
              color: AppColors.light20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(
          flex: 10,
        ),
      ],
    );
  }
}

class SecondSlide extends StatelessWidget {
  const SecondSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
            top: 128.0,
            right: 12.0,
            bottom: 32.0,
          ),
          child: SvgPicture.asset(
            AppAssets.track,
            height: .3.sh,
            width: 1.sw,
            fit: BoxFit.cover,
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 32.0,
            bottom: 12.0,
          ),
          child: Text(
            AppLocalizations.of(context)?.onBoardText2 ?? AppText.onBoardText2,
            style: AppTextStyle.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 12.0,
            left: 24.0,
            right: 24.0,
          ),
          child: Text(
            AppLocalizations.of(context)?.onBoardDesc2 ?? AppText.onBoardDesc2,
            style: AppTextStyle.bodyLarge.copyWith(color: AppColors.light20),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(
          flex: 10,
        )
      ],
    );
  }
}

class ThirdSlide extends StatelessWidget {
  const ThirdSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
            top: 128.0,
            right: 12.0,
            bottom: 32.0,
          ),
          child: SvgPicture.asset(
            AppAssets.plan,
            height: .3.sh,
            width: 1.sw,
            fit: BoxFit.cover,
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 32.0,
            bottom: 12.0,
          ),
          child: Text(
            AppLocalizations.of(context)?.onBoardText3 ?? AppText.onBoardText3,
            style: AppTextStyle.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 12.0,
            left: 24.0,
            right: 24.0,
          ),
          child: Text(
            AppLocalizations.of(context)?.onBoardDesc3 ?? AppText.onBoardDesc3,
            style: AppTextStyle.bodyLarge.copyWith(
              color: AppColors.light20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(
          flex: 10,
        ),
      ],
    );
  }
}
