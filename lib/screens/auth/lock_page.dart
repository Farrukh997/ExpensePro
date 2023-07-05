import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_pro/core/components/icons/arrow_forward.dart';
import 'package:expense_pro/core/components/icons/arrow_right_icon.dart';
import 'package:expense_pro/screens/account/setup_accout_page.dart';
import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LockPage extends StatefulWidget {
  static const route = '/lock';

  const LockPage({super.key});

  @override
  State<LockPage> createState() => _LockPageState();
}

class _LockPageState extends State<LockPage> {
  final List<int> _pin = [];
  final List<int> _pinRepeat = [];

  Widget _buble(bool check) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: 52.0,
        width: 52.0,
        decoration: BoxDecoration(
          color: check ? AppColors.light80 : AppColors.violet100,
          shape: BoxShape.circle,
          border: Border.all(
            color: check ? Colors.transparent : const Color(0xFFEEE5FF),
            width: 4.0,
          ),
        ),
      );

  Widget _buildBubles(List<int> list) {
    final len = list.length;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        for (int i = 0; i < len; i++) _buble(true),
        for (int i = 0; i < 4 - len; i++) _buble(false),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pin.length < 4
          ? lockBodyBuilder(
              AppLocalizations.of(context)?.letsSetUpPin ?? AppText.letsSetUpPin,
              _pin,
              _addPin,
            )
          : lockBodyBuilder(
              'Re enter your PIN again.',
              _pinRepeat,
              _addPinRepeat,
            ),
    );
  }

  void _addPin(int value) {
    if (_pin.length < 4) {
      setState(() => _pin.add(value));
    }
  }

  void _addPinRepeat(int value) {
    if (_pinRepeat.length < 4) {
      setState(() => _pinRepeat.add(value));
    }
    if (_pinRepeat.length == 4) {
      if (listEquals(_pin, _pinRepeat)) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SetUpAccount(),
            ));
      } else {
        setState(() {
          _pin.clear();
          _pinRepeat.clear();
        });
      }
    }
  }

  Widget lockBodyBuilder(
    String text,
    List<int> pin,
    ValueChanged<int> addPin,
  ) {
    return Container(
      alignment: Alignment.center,
      height: 1.sh,
      width: 1.sw,
      color: AppColors.violet100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          const SizedBox(
            height: 64.0,
          ),
          Text(
            text,
            style: AppTextStyle.titleSmallBold.copyWith(
              color: AppColors.light100,
            ),
          ),
          const SizedBox(
            height: 84.0,
          ),
          _buildBubles(pin),
          const Spacer(),
          Container(
            alignment: Alignment.bottomCenter,
            height: .7.sh,
            width: 1.sw,
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children: <Widget>[
                TextButton(
                  child: Text(
                    AppText.one,
                    style: AppTextStyle.headlineLarge.copyWith(
                      color: AppColors.light100,
                    ),
                  ),
                  onPressed: () => addPin.call(1),
                ),
                TextButton(
                  child: Text(
                    AppText.two,
                    style: AppTextStyle.headlineLarge.copyWith(
                      color: AppColors.light100,
                    ),
                  ),
                  onPressed: () => addPin(2),
                ),
                TextButton(
                  child: Text(
                    AppText.three,
                    style: AppTextStyle.headlineLarge.copyWith(
                      color: AppColors.light100,
                    ),
                  ),
                  onPressed: () => addPin(3),
                ),
                TextButton(
                  child: Text(
                    AppText.four,
                    style: AppTextStyle.headlineLarge.copyWith(
                      color: AppColors.light100,
                    ),
                  ),
                  onPressed: () => addPin(4),
                ),
                TextButton(
                  child: Text(
                    AppText.five,
                    style: AppTextStyle.headlineLarge.copyWith(
                      color: AppColors.light100,
                    ),
                  ),
                  onPressed: () => addPin(5),
                ),
                TextButton(
                  child: Text(
                    AppText.six,
                    style: AppTextStyle.headlineLarge.copyWith(
                      color: AppColors.light100,
                    ),
                  ),
                  onPressed: () => addPin(6),
                ),
                TextButton(
                  child: Text(
                    AppText.seven,
                    style: AppTextStyle.headlineLarge.copyWith(
                      color: AppColors.light100,
                    ),
                  ),
                  onPressed: () => addPin(7),
                ),
                TextButton(
                  child: Text(
                    AppText.eight,
                    style: AppTextStyle.headlineLarge.copyWith(
                      color: AppColors.light100,
                    ),
                  ),
                  onPressed: () => addPin(8),
                ),
                TextButton(
                  child: Text(
                    AppText.nine,
                    style: AppTextStyle.headlineLarge.copyWith(
                      color: AppColors.light100,
                    ),
                  ),
                  onPressed: () => addPin(9),
                ),
                Container(),
                TextButton(
                  child: Text(
                    AppText.zero,
                    style: AppTextStyle.headlineLarge.copyWith(
                      color: AppColors.light100,
                    ),
                  ),
                  onPressed: () => addPin(0),
                ),
                TextButton(
                  child: const Icon(
                    ArrowForward.arrow_right,
                    color: AppColors.light100,
                    size: 64.0,
                  ),
                  onPressed: () {
                    if (_pin.isNotEmpty) {
                      setState(() => pin.removeLast());
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
