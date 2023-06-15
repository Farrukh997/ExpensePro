import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.elevation = 0.0,
    this.color = AppColors.violet100,
    this.textColor = AppColors.light100,
    this.width,
    this.height,
    this.focusElevation,
    this.hoverElevation,
  });

  final String text;
  final Color color;
  final double elevation;
  final double? focusElevation;
  final double? hoverElevation;
  final Color textColor;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      highlightElevation: 2.0,
      elevation: elevation,
      focusElevation: focusElevation,
      hoverElevation: hoverElevation,
      color: color,
      height: height ?? .07.sh,
      minWidth: width ?? 1.sw,
      onPressed: onPressed,
      child: icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon!,
                const SizedBox(width: 8.0),
                Text(
                  text,
                  style: AppTextStyle.titleSmallBold.copyWith(
                    color: textColor,
                  ),
                ),
              ],
            )
          : Text(
              text,
              style: AppTextStyle.titleSmallBold.copyWith(
                color: textColor,
              ),
            ),
    );
  }
}
