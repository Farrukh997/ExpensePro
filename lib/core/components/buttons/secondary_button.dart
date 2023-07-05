import 'package:expense_pro/core/components/buttons/primary_button.dart';
import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
  });

  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      width: width,
      height: height,
      color: AppColors.violet20,
      textColor: AppColors.violet100,
      text: text,
      onPressed: onPressed,
    );
  }
}
