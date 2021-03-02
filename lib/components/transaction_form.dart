import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final void Function(String, int) onSubmit;

  TransactionForm({this.onSubmit});

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    final title = titleController.text;
                    final value = double.tryParse(valueController.text) ?? 0;

                    final intValue = (value * 100).round();

                    onSubmit(title, intValue);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
