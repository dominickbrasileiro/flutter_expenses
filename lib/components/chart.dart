import 'package:flutter/material.dart';
import 'package:flutter_expenses/models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      final dayFirstLetter = DateFormat.E().format(weekDay)[0];

      final filteredTransactions = recentTransactions.where((transaction) {
        bool sameDay = transaction.date.day == weekDay.day;
        bool sameMonth = transaction.date.month == weekDay.month;
        bool sameYear = transaction.date.year == weekDay.year;

        return sameDay && sameMonth && sameYear;
      });

      final int total = filteredTransactions.fold(
          0, (acc, transaction) => acc + transaction.value);

      print(dayFirstLetter);
      print(total);

      return {
        'day': dayFirstLetter,
        'value': total,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    this.groupedTransactions;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactions.map((transaction) {
          return Text('${transaction['day']}: ${transaction['value']}');
        }).toList(),
      ),
    );
  }
}
