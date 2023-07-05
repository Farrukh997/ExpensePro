import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        decoration: const BoxDecoration(
          color: AppColors.violet20,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(24.0),
            right: Radius.circular(24.0),
          ),
        ),
        child: Text(
          text,
          style: AppTextStyle.bodySmall.copyWith(
            color: AppColors.violet100,
          ),
        ),
      ),
    );
  }
}
