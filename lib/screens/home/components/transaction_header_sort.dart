import 'package:expense_pro/core/components/navigation/header.dart';
import 'package:expense_pro/utils/res/app_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const zero = 0;
const one = 1;
const two = 2;
const three = 3;

class TransactionHeaderSort extends StatefulWidget {
  const TransactionHeaderSort({
    super.key,
    required this.transactionChanged,
  });

  final ValueChanged<int> transactionChanged;

  @override
  State<TransactionHeaderSort> createState() => _TransactionHeaderSortState();
}

class _TransactionHeaderSortState extends State<TransactionHeaderSort> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: <Widget>[
          Header(
            onTap: () {
              setState(() => _selected = zero);
              widget.transactionChanged(zero);
            },
            isSelected: _selected == 0,
            title: AppLocalizations.of(context)?.today ?? AppText.today,
          ),
          Header(
            onTap: () {
              setState(() => _selected = one);
              widget.transactionChanged(one);
            },
            isSelected: _selected == 1,
            title: AppLocalizations.of(context)?.week ?? AppText.week,
          ),
          Header(
            onTap: () {
              setState(() => _selected = two);
              widget.transactionChanged(two);
            },
            isSelected: _selected == 2,
            title: AppLocalizations.of(context)?.month ?? AppText.month,
          ),
          Header(
            onTap: () {
              setState(() => _selected = three);
              widget.transactionChanged(three);
            },
            isSelected: _selected == 3,
            title: AppLocalizations.of(context)?.year ?? AppText.year,
          ),
        ],
      ),
    );
  }
}
