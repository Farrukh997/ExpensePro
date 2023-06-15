class User {
  User(
    this.uid, {
    this.firstname,
    this.lastname,
    this.phone,
    this.email,
  });

  final String uid;
  final String? firstname;
  final String? lastname;
  final String? phone;
  final String? email;

  String get fullName => ('${firstname ?? ''} ${lastname ?? ''}');
}
