import 'package:expense_pro/domain/models/transaction.dart';
import 'package:expense_pro/utils/extenstions/extensions.dart';
import 'package:expense_pro/utils/res/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getMonth(int month, BuildContext context) {
  switch (month) {
    case 1:
      return AppLocalizations.of(context)?.january ?? AppText.january;
    case 2:
      return AppLocalizations.of(context)?.february ?? AppText.february;
    case 3:
      return AppLocalizations.of(context)?.march ?? AppText.march;
    case 4:
      return AppLocalizations.of(context)?.april ?? AppText.april;
    case 5:
      return AppLocalizations.of(context)?.may ?? AppText.may;
    case 6:
      return AppLocalizations.of(context)?.june ?? AppText.june;
    case 7:
      return AppLocalizations.of(context)?.july ?? AppText.july;
    case 8:
      return AppLocalizations.of(context)?.august ?? AppText.august;
    case 9:
      return AppLocalizations.of(context)?.september ?? AppText.september;
    case 10:
      return AppLocalizations.of(context)?.october ?? AppText.october;
    case 11:
      return AppLocalizations.of(context)?.november ?? AppText.november;
    case 12:
      return AppLocalizations.of(context)?.december ?? AppText.december;
    default:
      return '';
  }
}

String getAmount(Transaction item) {
  String sign = item.amount < 0 ? '-' : '';
  num amount = (item.amount < 0 ? -1 * item.amount : item.amount).sumFormat();
  return '$sign\$$amount';
}

String getCorrectTimeFormat(DateTime time) {
  String hour = time.hour < 10 ? '0${time.hour}' : '${time.hour}';
  String minute = time.minute < 10 ? '0${time.minute}' : '${time.minute}';
  return '$hour:$minute';
}
