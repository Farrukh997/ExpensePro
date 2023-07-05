import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  final bool isSelected;
  final String title;
  final VoidCallback onTap;

  const Header({
    super.key,
    required this.isSelected,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 6.0,
        ),
        width: 130.w,
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: isSelected ? const Color(0xFFBBBBBB) : Colors.transparent,
        ),
        child: Text(
          title,
          style: AppTextStyle.bodyLarge.copyWith(
            color: isSelected ? AppColors.yellow100 : AppColors.light20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
