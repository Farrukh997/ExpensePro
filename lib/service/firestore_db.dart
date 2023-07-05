import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_pro/domain/models/transaction.dart' as t;

enum TransactionQuery { year, month, week, day }

// extension on Query{
//   Query queryBy(TransactionQuery query){
//     switch (query) {
//       case TransactionQuery.day:
//         return where('');
//       default:
//     }
//   }
// }

class FirebaseCloudDB {
  FirebaseCloudDB._internal();

  static final instance = FirebaseCloudDB._internal();

  final db = FirebaseFirestore.instance;

  CollectionReference<t.Transaction> getTransactions() {
    final data = db.collection('transactions').withConverter<t.Transaction>(
          fromFirestore: (snapshot, options) =>
              t.Transaction.fromJson(snapshot.data() ?? {}),
          toFirestore: (value, options) => value.toJson(),
        );
    return data;
  }
}
