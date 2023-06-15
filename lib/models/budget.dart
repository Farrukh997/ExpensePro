import 'transaction_category.dart';

class Budget {
  final int? id;
  final ExpenseCategory category;
  final double limit;
  final double spent;
  final bool alert;
  final double alertLevel;

  Budget({
    this.id,
    required this.category,
    required this.limit,
    required this.spent,
    required this.alert,
    required this.alertLevel,
  });

  factory Budget.fromJson(Map json) => Budget(
        id: json['id'],
        category: json['category'],
        limit: json['limit'],
        spent: json['spent'],
        alert: json['alert'],
        alertLevel: json['alert_level'],
      );

  Map toJson() => {
        'id': id,
        'category': category,
        'limit': limit,
        'spent': spent,
        'alert': alert,
        'alert_level': alertLevel,
      };
}
