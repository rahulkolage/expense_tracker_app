import 'package:expense_tracker_app/widgets/expeses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/model/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          // margin: const EdgeInsets.symmetric(horizontal: 16),
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
        ),
        child: ExpenseItem(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
      ),
    );
  }
}
