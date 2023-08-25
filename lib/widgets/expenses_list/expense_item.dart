import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(expense.title),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text('\$${expense.amount.toStringAsFixed(2)}'),
              const Spacer(),
              Row(
                children: [
                  Icon(
                    categoryIcons[expense.category],
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  Text(expense.formattedDate)
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
