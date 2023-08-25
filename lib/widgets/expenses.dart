import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:system_theme/system_theme.dart';

import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _regExpenses = [
    Expense(
        title: 'Flutter Expense App',
        amount: 69.69,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amount: 15.69,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _regExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _regExpenses.indexOf(expense);
    setState(() {
      _regExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    // Creating the undo deletion of an expense
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('Expense deleted'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _regExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found. Add Expenses!'),
    );

    if (_regExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _regExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          ElevatedButton.icon(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
            label: const Text('Add Expense'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Text(
              'Expense Cards',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: SystemTheme.isDarkMode
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: mainContent)
          ],
        ),
      ),
    );
  }
}
