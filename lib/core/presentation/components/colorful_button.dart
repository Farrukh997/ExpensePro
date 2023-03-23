import 'package:expense_pro/core/presentation/res/colors.dart';
import 'package:flutter/material.dart';

class ColorfulButton extends StatelessWidget {
  const ColorfulButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialButton(
      elevation: 0.0,
      color: AppColor.violet100,
      height: size.height * .07,
      minWidth: size.width,
      onPressed: onPressed,
      child: child,
    );
  }
}
