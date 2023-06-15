import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
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

  Widget _buble(bool check) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: 42.0,
        width: 42.0,
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
      body: Container(
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
              AppLocalizations.of(context)?.letsSetUpPin ?? '',
              style: AppTextStyle.titleSmallBold.copyWith(
                color: AppColors.light100,
              ),
            ),
            const SizedBox(
              height: 84.0,
            ),
            _buildBubles(_pin),
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
                      '1',
                      style: AppTextStyle.headlineLarge.copyWith(
                        color: AppColors.light100,
                      ),
                    ),
                    onPressed: () => _addPin(1),
                  ),
                  TextButton(
                    child: Text(
                      '2',
                      style: AppTextStyle.headlineLarge.copyWith(
                        color: AppColors.light100,
                      ),
                    ),
                    onPressed: () => _addPin(2),
                  ),
                  TextButton(
                    child: Text(
                      '3',
                      style: AppTextStyle.headlineLarge.copyWith(
                        color: AppColors.light100,
                      ),
                    ),
                    onPressed: () => _addPin(3),
                  ),
                  TextButton(
                    child: Text(
                      '4',
                      style: AppTextStyle.headlineLarge.copyWith(
                        color: AppColors.light100,
                      ),
                    ),
                    onPressed: () => _addPin(4),
                  ),
                  TextButton(
                    child: Text(
                      '5',
                      style: AppTextStyle.headlineLarge.copyWith(
                        color: AppColors.light100,
                      ),
                    ),
                    onPressed: () => _addPin(5),
                  ),
                  TextButton(
                    child: Text(
                      '6',
                      style: AppTextStyle.headlineLarge.copyWith(
                        color: AppColors.light100,
                      ),
                    ),
                    onPressed: () => _addPin(6),
                  ),
                  TextButton(
                    child: Text(
                      '7',
                      style: AppTextStyle.headlineLarge.copyWith(
                        color: AppColors.light100,
                      ),
                    ),
                    onPressed: () => _addPin(7),
                  ),
                  TextButton(
                    child: Text(
                      '8',
                      style: AppTextStyle.headlineLarge.copyWith(
                        color: AppColors.light100,
                      ),
                    ),
                    onPressed: () => _addPin(8),
                  ),
                  TextButton(
                    child: Text(
                      '9',
                      style: AppTextStyle.headlineLarge.copyWith(
                        color: AppColors.light100,
                      ),
                    ),
                    onPressed: () => _addPin(9),
                  ),
                  Container(),
                  TextButton(
                    child: Text(
                      '0',
                      style: AppTextStyle.headlineLarge.copyWith(
                        color: AppColors.light100,
                      ),
                    ),
                    onPressed: () => _addPin(0),
                  ),
                  TextButton(
                    child: const Icon(
                      Icons.arrow_forward,
                      color: AppColors.light100,
                      size: 64.0,
                    ),
                    onPressed: () {
                      if (_pin.isNotEmpty) {
                        setState(() => _pin.removeLast());
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addPin(int value) {
    if (_pin.length < 4) {
      setState(() => _pin.add(value));
    }
  }
}
