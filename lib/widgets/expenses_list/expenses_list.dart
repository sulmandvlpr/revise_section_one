// //Widget Holds UI and logic for List<Expnses> that List we gona desplay on Main UI
// //temarary it just hold the List<modelExp> later it will manage  the logic of adding List
// //this Widget is List of Expense Used to hold list of Expnse Model, Take single item with ui/card save logis for Adding new Exense to List<modelExp> and send to Expnse Screen Class
// import 'package:flutter/material.dart';
// import 'package:revise_section_one/models/expence.dart';

// import 'expense_item.dart';

// class ExpensesList extends StatelessWidget {
// //except list<modlexp> as input
//   const ExpensesList(
//       {super.key, required this.expenses, required this.onRemoveExpenses});

//   final List<Expense> expenses;
//   final Function(Expense expense) onRemoveExpenses;

//   @override
//   Widget build(BuildContext context) {
//     //retunr List<modlExp>
//     return ListView.builder(
//         itemCount: expenses.length,
//         //expnses is List so we pass itemBuilder[index] as index value

//         //we want to swip remove the list item so wo set logic on List
//         itemBuilder: (context, index) => Dismissible(
//             //add an effect of backgournd when removing item

//             //key is used for uniquely identify Widget and its data
//             //in our case we want to delete correct list item so
//             //to identify item in list we use key and pass list index
//             key: ValueKey(expenses[index]),
//             background: Container(
//               color: Theme.of(context).colorScheme.error.withOpacity(0.75),
//               margin: EdgeInsets.symmetric(
//                   horizontal: Theme.of(context).cardTheme.margin!.horizontal),
//             ),
//             //Dismisable cause some ui error so we set onDismissed property
//             //onDismissed take direction as input and a function to remove remove expnse
//             //we pass direction as input and make a
//             //remove expense fuction in expenses widget class and pass as named args in this class
//             onDismissed: (direction) {
//               onRemoveExpenses(expenses[index]);
//             },
//             child: ExpenseItem(expenses[index])));
//   }
// }
