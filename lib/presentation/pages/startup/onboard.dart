import 'package:expense_pro/presentation/components/colorful_button.dart';
import 'package:expense_pro/presentation/pages/home.dart';
import 'package:expense_pro/presentation/pages/auth/login.dart';
import 'package:expense_pro/res/app_assets.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
      indicatorList
          .add(i == currentIndex ? _indicator(true) : _indicator(false));
    }
    return indicatorList;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            allowImplicitScrolling: true,
            onPageChanged: (index) {
              setState(() => _index = index);
            },
            children: [
              FirstSlide(size: size),
              SecondSlide(size: size),
              ThirdSlide(size: size),
            ],
          ),
          Positioned(
            bottom: 48.0,
            left: 0.0,
            right: 0.0,
            child: Column(
              children: [
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
                  child: ColorfulButton(
                    text: AppLocalizations.of(context)?.login ?? '',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: MaterialButton(
                    elevation: 0.0,
                    color: AppColors.violet20,
                    textColor: Colors.white,
                    height: size.height * .07,
                    child: Text(
                      AppLocalizations.of(context)?.skip ?? '',
                      style: AppTextStyle.title3
                          .copyWith(color: AppColors.violet100),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
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
  const FirstSlide({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: size.height * .5,
          width: size.width,
          padding: const EdgeInsets.only(
            top: 128.0,
            bottom: 32.0,
            left: 24.0,
            right: 24.0,
          ),
          child: SvgPicture.asset(
            AppAssets.control,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 32.0,
            bottom: 12.0,
          ),
          child: Text(
            AppLocalizations.of(context)?.onBoardText1 ?? '',
            style: AppTextStyle.title1,
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
            AppLocalizations.of(context)?.onBoardDesc1 ?? '',
            style: AppTextStyle.regular1.copyWith(
              color: AppColors.light20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class SecondSlide extends StatelessWidget {
  final Size size;

  const SecondSlide({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: size.height * .5,
          width: size.width,
          padding: const EdgeInsets.only(
            top: 128.0,
            bottom: 32.0,
            left: 24.0,
            right: 24.0,
          ),
          child: SvgPicture.asset(
            AppAssets.track,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 32.0,
            bottom: 12.0,
          ),
          child: Text(
            AppLocalizations.of(context)?.onBoardText2 ?? '',
            style: AppTextStyle.title1,
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
            AppLocalizations.of(context)?.onBoardDesc2 ?? '',
            style: AppTextStyle.regular1.copyWith(
              color: AppColors.light20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class ThirdSlide extends StatelessWidget {
  final Size size;

  const ThirdSlide({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: size.height * .5,
          width: size.width,
          padding: const EdgeInsets.only(
            top: 128.0,
            bottom: 32.0,
            left: 24.0,
            right: 24.0,
          ),
          child: SvgPicture.asset(
            AppAssets.plan,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 32.0,
            bottom: 12.0,
          ),
          child: Text(
            AppLocalizations.of(context)?.onBoardText3 ?? '',
            style: AppTextStyle.title1,
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
            AppLocalizations.of(context)?.onBoardDesc3 ?? '',
            style: AppTextStyle.regular1.copyWith(
              color: AppColors.light20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
