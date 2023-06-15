import 'transaction_type.dart';
import 'account.dart';
import 'transaction_category.dart';

enum Time {
  today,
  week,
  month,
  year,
}

class Transaction {
  final int? id;
  final String description;
  final Account account;
  final TransactionType type;
  final ExpenseCategory category;
  final String attachment;
  final double amount;
  final DateTime time;

  Transaction({
    this.id,
    required this.description,
    required this.type,
    required this.category,
    required this.time,
    required this.amount,
    required this.account,
    required this.attachment,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json['id'],
        description: json['description'],
        category: json['category'] ?? ExpenseCategory.food,
        type: TransactionType.values[json['type'] ?? 1],
        time: DateTime.tryParse(json['time']) ?? DateTime(1),
        amount: double.parse(json['amount'].toString()),
        account: Account(0.0, AccountType.wallet, ''),
        attachment: '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'type': type.index,
        'category': category,
        'time': time,
        'amount': amount,
      };
}
