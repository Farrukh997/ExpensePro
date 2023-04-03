import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final _list = [
    'Today',
    'Week',
    'Month',
    'Year',
  ];

  String _value = 'Today';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 36.0,
                  width: 140.0,
                  child: DropdownButtonFormField(
                    icon: const SizedBox(
                      height: 0,
                      width: 0,
                    ),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.keyboard_arrow_down),
                      contentPadding: EdgeInsets.zero,
                    ),
                    value: _value,
                    items: _list
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (String? value) {
                      setState(() {
                        if (value != null) {
                          _value = value;
                        }
                      });
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.sort),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: MaterialButton(
              padding: const EdgeInsets.all(16.0),
              elevation: 0.0,
              color: const Color(0xFFEEE5FF),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'See your financial report',
                    style: AppTextStyle.regular1.copyWith(color: AppColors.violet100),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: AppColors.violet100,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
