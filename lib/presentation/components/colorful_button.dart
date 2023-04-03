import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/material.dart';

class ColorfulButton extends StatelessWidget {
  const ColorfulButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialButton(
      elevation: 0.0,
      color: AppColors.violet100,
      height: size.height * .07,
      minWidth: size.width,
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyle.title3.copyWith(
          color: AppColors.light100,
        ),
      ),
    );
  }
}
