import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionBottomSheet extends StatelessWidget {
  const TransactionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: Column(
        children: <Widget>[
          Container(
            width: 32.0,
            height: 4.0,
            decoration: BoxDecoration(
              color: AppColors.violet40,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          DropdownButtonFormField<String>(
            items: const <DropdownMenuItem<String>>[
              DropdownMenuItem(
                child: Text('item'),
              ),
            ],
            onChanged: (Object? value) {},
          )
        ],
      ),
    );
  }
}
