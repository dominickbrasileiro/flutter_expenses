import 'package:flutter/material.dart';
import 'package:flutter_expenses/components/transaction_tile.dart';
import 'package:flutter_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(int) onDelete;

  const TransactionList(this.transactions, {this.onDelete});

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
              return TransactionTile(
                transaction: transactions[index],
                onDelete: onDelete,
              );
            },
          );
  }
}
