enum AccountType { wallet, bank, cash }

class Account {
  final double balance;
  final AccountType accountType;
  final String accountTitle;

  Account({
    required this.balance,
    required this.accountType,
    required this.accountTitle,
  });

  factory Account.fromJson(Map json) => Account(
        balance: json['balance'],
        accountType: json['accountType'],
        accountTitle: json['accountTitle'],
      );

  Map toJson() => {
        'balance': balance,
        'accountType': accountType,
        'accountTitle': accountTitle,
      };
}
