import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_pro/models/transaction.dart' as model;

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

class FirestoreDb {
  final db = FirebaseFirestore.instance;

  FirestoreDb() {
    db.enableNetwork();
    db.settings.persistenceEnabled;
  }

  CollectionReference<model.Transaction> getTransactions() {
    final data = db.collection('transactions').withConverter<model.Transaction>(
          fromFirestore: (snapshot, options) =>
              model.Transaction.fromJson(snapshot.data()?[0]),
          toFirestore: (value, options) => value.toJson(),
        );
    return data;
  }
}
