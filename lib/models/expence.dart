// //data structure class for data which holds chart data for widget Chart

// //to generate unique id we import dart uuid terminal: flutter pub add uuid

// import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';
// import 'package:intl/intl.dart';

// //we can set utility object out side of class
// final formatter = DateFormat.yMd();

// const uuid = Uuid();

// //Fixed values of Object with diffrent category is ENUM
// //define outside of class use in class constructore as paraments
// enum Category { food, trave, leisure, work }

// //we want to display icons dynamically based on catrogry type
// //for that we need catroty and icon variables at same time so we use map
// const catrogryIcons = {
//   // key is catregory and value is Icons
//   Category.food: Icons.lunch_dining,
//   Category.trave: Icons.flight_takeoff,
//   Category.leisure: Icons.movie,
//   Category.work: Icons.work,
// };

// class Expense {
// //we want to genrate a unique id when we instantiate the Expnse obect,for this
// //we use initializer list

// // we use named paramets not positional cause we need diffrent values when crating obect
//   Expense(
//       {required this.title,
//       required this.amount,
//       required this.date,
//       required this.category})
//       : id = uuid.v4(); //inital value of id is uuid.v4
//   final String id;
//   final String title;
//   final double amount;
//   final DateTime date;
//   final Category category;

// //getter method for fomrating date
//   String get formattedDate {
//     //format convert date to
//     return formatter.format(date);
//   }
// }
// //this class give us calcuated sum of secific category and all categories and then we display as chart bar
// //this class  also have diffrent constructors for sum of all categories and specific cagegory

// class ExpenseBucket {
//   //1st constructor for sum of all categories
//   const ExpenseBucket({required this.category, required this.expenses});

//   //2nd constructor for sum of  specific category
//   // : is called  intitlizer list
//   // now we filter allExpense to get specific cagegory of expense
//   //where() allow us to filter  list we return true if we want that elemet/expnse in that list or false to elemnate the element
//   //in => expense.category == category).toList(); we check element.category is equal to the category of class proterty
//   ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
//       : expenses = allExpenses
//             .where((expense) => expense.category == category)
//             .toList();

//   final Category category;
//   final List<Expense> expenses;

// //a getter method to get sum of amount of  all categories
//   double get totalExpense {
//     double sum = 0;

// //now we loop throug that list and cacluate all expenses
// //for that we need to loop through the list
// //for list looping we use this special syntax
//     for (final expense in expenses) {
// //this expenses loop variable holds the single element in list expenses and we perform opration on this single element of list
//       sum = sum + expense.amount;
//     }

//     //this getter will return sum of all categries list
//     return sum;
//   }
// }
