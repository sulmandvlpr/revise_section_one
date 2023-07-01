// //Main UI Screen

// import 'package:flutter/material.dart';
// import 'package:revise_section_one/widgets/chart/char.dart';
// import 'package:revise_section_one/widgets/expenses_list/expenses_list.dart';

// import '../models/expence.dart';
// import 'new_expense.dart';

// class Expenses extends StatefulWidget {
//   const Expenses({super.key});
//   @override
//   State<StatefulWidget> createState() {
//     return _ExpnesesState();
//   }
// }

// class _ExpnesesState extends State<Expenses> {
//   //variable  for store  Expnse model list
//   //inside  list we have Expnses
//   //later we create data class to store List<modelExpn>
//   final List<Expense> _registeredExpnses = [
//     Expense(
//         title: 'App-Code',
//         amount: 19.2,
//         date: DateTime.now(),
//         category: Category.work),
//     Expense(
//         title: 'Cinema',
//         amount: 8.1,
//         date: DateTime.now(),
//         category: Category.leisure),
//     Expense(
//         title: 'NewYork',
//         amount: 72.3,
//         date: DateTime.now(),
//         category: Category.trave),
//   ];

//   //open overlay sheet to add new expense with + icon
//   void _openAddExpnseOverlay() {
//     //show disply overlay sheets
//     showModalBottomSheet(
//       //show full sceen sheet takes full height
//       isScrollControlled: true,
//       context: context,
//       builder: ((context) =>
//           //replace with form widget later

//           // add newely added expense
//           //now this _addExpense is named parameter
//           NewExpense(
//             onAddExpense: _addExpense,
//           )),
//     );
//   }

//   // take Expense as input
//   void _addExpense(Expense expense) {
//     //we add new Expens in  List of <Expnese>
//     //and we must need to update ui with setState
//     setState(
//       () {
//         _registeredExpnses.add(expense);
//       },
//     );
//   }

//   //remove expense item from list
//   void _removeExpense(Expense expense) {
//     //get the posting of element in list
//     final expenseIndex = _registeredExpnses.indexOf(expense);
//     setState(() {
//       _registeredExpnses.remove(expense);
//     });

// // now clear all snacbar messages
//     ScaffoldMessenger.of(context).clearSnackBars();

//     //for show overlay we use showMethod
//     //for show and hide Ui element we use show
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         duration: const Duration(seconds: 3),
//         content: const Text('Expense Deleted'),
//         action: SnackBarAction(
//             label: 'Undo',
//             onPressed: (() {
//               setState(() {
//                 _registeredExpnses.insert(expenseIndex, expense);
//               });
//             })),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     //create a varible mainConent to store text for no list or list
//     Widget mainConent = const Center(
//       child: Text('No expnse found, Sart Adding Some!'),
//     );

// //check if the list is not empty
//     if (_registeredExpnses.isNotEmpty) {
//       mainConent = ExpensesList(
//           expenses: _registeredExpnses, onRemoveExpenses: _removeExpense);
//     }
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Expneses Screen'),
//         actions: [
//           IconButton(
//               onPressed: _openAddExpnseOverlay, icon: const Icon(Icons.add)),
//         ],
//       ),
//       //Column for Char and List UI
//       //we have Column inside we have another Colum for List view which caus conflict
//       //inner column have its own size we need to restrict this inner size
//       //we solve this by warpping inner column by Expanded Widget
//       body: Column(
//         children: [
//           Chart(expenses: _registeredExpnses),
//           //Expanded controlls inner Column size
//           Expanded(child: mainConent),
//         ],
//       ),
//     );
//   }
// }
