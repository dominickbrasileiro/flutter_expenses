import 'package:flutter/material.dart';
import 'package:flutter_expenses/models/transaction.dart';
import 'package:flutter_expenses/components/transaction_list.dart';
import 'package:flutter_expenses/components/transaction_form.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 1,
      title: 'Food',
      value: 11076,
      date: DateTime.now(),
    ),
    Transaction(
      id: 2,
      title: 'A New Smartphone',
      value: 46000,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(),
      ],
    );
  }
}
