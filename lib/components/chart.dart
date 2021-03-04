import 'package:flutter/material.dart';
import 'package:flutter_expenses/components/chart_bar.dart';
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
    }).reversed.toList();
  }

  double get _weekTotal {
    return groupedTransactions.fold(
      0.0,
      (acc, transaction) => acc + transaction['value'],
    );
  }

  @override
  Widget build(BuildContext context) {
    this.groupedTransactions;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((transaction) {
            final String transactionDay = transaction['day'];
            final int transactionValue = transaction['value'];

            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: transactionDay,
                value: transactionValue / 100,
                percentage: transactionValue / _weekTotal,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
