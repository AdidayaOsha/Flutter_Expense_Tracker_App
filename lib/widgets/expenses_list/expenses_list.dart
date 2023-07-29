import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
// set to accept the expenses as input
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    // if you use the list of unknown length, do not use Column Widget.
    // use ListView instead: Scrollable List with the builder.
    // builder: only build the list when it reaches the list/screen area.
    return ListView.builder(
      itemCount: expenses.length,
      // Dimissible: Swipeable (Need Key Value, not like most of the widgets that does not need any key)
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          //error theme auto generated from the seed color
          color: Theme.of(context).colorScheme.error.withOpacity(0.50),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
