import 'package:flutter/foundation.dart';

class Transaction {
  final int id;
  final String title;
  final int value;
  final DateTime date;

  const Transaction({
    @required this.id,
    @required this.title,
    @required this.value,
    @required this.date,
  });
}
