import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(int) onDelete;

  TransactionList(this.transactions, {this.onDelete});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) => Column(
              children: [
                SizedBox(height: 24),
                Container(
                  height: 24,
                  child: Text(
                    'Nothing here...',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  height: constraints.maxHeight * 0.5,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final transaction = transactions[index];

              return Card(
                margin: EdgeInsets.symmetric(
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
                          label: Text('Delete Transaction'),
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
            },
          );
  }
}
