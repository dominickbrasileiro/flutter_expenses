import 'package:flutter/material.dart';
import 'package:flutter_expenses/components/transaction_list.dart';
import 'package:flutter_expenses/models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Text('Graph'),
          ),
          TransactionList(_transactions),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                  TextField(
                    controller: valueController,
                    decoration: InputDecoration(
                      labelText: 'Value (\$)',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        textColor: Colors.red,
                        child: Text(
                          'Add Transaction',
                        ),
                        onPressed: () {
                          print(titleController.text);
                          print(valueController.text);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
