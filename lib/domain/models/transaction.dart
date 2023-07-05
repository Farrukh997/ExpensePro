import 'account.dart';

enum TransactionType {
  income,
  expense,
  transfer,
  other,
}

enum ExpenseCategory {
  food,
  shopping,
  subscription,
  transportation,
}

enum IncomeCategory {
  salary,
  other,
}

enum Time {
  today,
  week,
  month,
  year,
}

class Transaction {
  final int? id;
  final Enum? category;
  final TransactionType type;
  final String description;
  final Account account;
  final String attachment;
  final double amount;
  final DateTime time;

  Transaction({
    this.id,
    required this.description,
    required this.account,
    required this.attachment,
    required this.amount,
    required this.time,
    required this.type,
    required this.category,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    var type = TransactionType.values.singleWhere(
      (element) => element.name == json['type'],
      orElse: () => TransactionType.other,
    );
    return Transaction(
      id: json['id'],
      category: type == TransactionType.expense
          ? ExpenseCategory.values.singleWhere(
              (element) => element.name == json['category'],
              orElse: () => ExpenseCategory.food,
            )
          : type == TransactionType.income
              ? IncomeCategory.values.singleWhere(
                  (element) => element.name == json['category'],
                )
              : null,
      description: json['description'],
      account: json['account'],
      attachment: json['attachment'],
      amount: double.parse(json['amount'].toString()),
      time: DateTime.tryParse(json['time']) ?? DateTime(1),
      type: type,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'account': account,
        'attachment': attachment,
        'amount': amount,
        'time': time.toIso8601String(),
        'category': category,
      };
}
