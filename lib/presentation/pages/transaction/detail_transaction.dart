import 'package:flutter/material.dart';

class DetailTransaction extends StatefulWidget {
  const DetailTransaction({Key? key}) : super(key: key);

  @override
  State<DetailTransaction> createState() => _DetailTransactionState();
}

class _DetailTransactionState extends State<DetailTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('Detail Transaction'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
