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
