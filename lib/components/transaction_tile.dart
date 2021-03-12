import 'package:flutter/material.dart';
import 'package:flutter_expenses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionTile extends StatelessWidget {
  final Transaction transaction;
  final Function(int) onDelete;

  TransactionTile({
    @required this.transaction,
    @required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 8,
      ),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\$${(transaction.value / 100).toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                icon: Icon(Icons.delete),
                label: const Text('Delete Transaction'),
                textColor: Theme.of(context).errorColor,
                onPressed: () => onDelete(transaction.id),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => onDelete(transaction.id),
              ),
      ),
    );
  }
}
