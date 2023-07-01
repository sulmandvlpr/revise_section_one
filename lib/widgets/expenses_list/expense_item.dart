// //holds Single Item of List<Expnse> Widget
// import 'package:flutter/material.dart';

// import '../../models/expence.dart';

// class ExpenseItem extends StatelessWidget {
// //we use expnse data so we use as input value of constructor para
//   const ExpenseItem(this.expense, {super.key});

//   final Expense expense;
//   @override
//   Widget build(BuildContext context) {
//     return
//         //single Item of list as Card Card for styling
//         Card(
//             child: Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 20,
//         vertical: 10,
//       ),
//       //use Column cause we have titel beneth we have amout below that we have categroy
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             expense.title,
//             style: Theme.of(context).textTheme.titleLarge,
//           ),
//           const SizedBox(height: 4),
//           //categroy and date
//           Row(
//             children: [
//               //toStg convert double to Stg and toStgAsFix() convert to 12.23 two vlaues
//               //to inject values in string we use $ but here we have more complex value
//               // so we extend with ${stg value}
//               Text('\$${expense.amount.toStringAsFixed(2)}'),
//               //spacer take remian space we use in center btw text and row
//               //space will take all space btw widgets
//               const Spacer(),
//               //Row for date and categoy
//               Row(
//                 children: [
//                   Icon(catrogryIcons[expense.category]),
//                   const SizedBox(
//                     width: 8,
//                   ),
//                   //date of expnse with fomratted getter method
//                   Text(expense.formattedDate),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     ));
//   }
// }
