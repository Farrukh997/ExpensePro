enum AccountType { wallet, bank, cash }

class Account {
  final double balance;
  final AccountType accountType;
  final String accountTitle;

  Account(
    this.balance,
    this.accountType,
    this.accountTitle,
  );

  factory Account.fromJson(Map json) => Account(
        json['balance'],
        json['accountType'],
        json['accountTitle'],
      );

  Map toJson() => {
        'balance': balance,
        'accountType': accountType,
        'accountTitle': accountTitle,
      };
}
