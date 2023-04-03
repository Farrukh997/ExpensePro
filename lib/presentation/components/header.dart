import 'package:easy_localization/easy_localization.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final bool isSelected;
  final String title;
  const Header({
    super.key,
    required this.isSelected,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 8.0,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: isSelected ? const Color(0xFFBBBBBB) : Colors.transparent,
      ),
      child: Text(
        title.tr(),
        style: AppTextStyle.regular1.copyWith(
          color: isSelected ? AppColors.yellow100 : AppColors.light20,
        ),
      ),
    );
  }
}
