// //this widget holds single grid item View for categories grid which we display in  categories.dart screen
// //accept categroy from model categories class
// import 'package:flutter/material.dart';
// import 'package:revise_section_one/models/category.dart';

// class CategoryGridItem extends StatelessWidget {
//   const CategoryGridItem(
//       {super.key, required this.category, required this.onSelectCategory});

//   final Category category;
// //this fuction is tap able event when we click on category in Categories class
//   final void Function() onSelectCategory;
//   @override
//   Widget build(BuildContext context) {
//     //tap able single category item
//     return InkWell(
//       onTap: () {
//         onSelectCategory();
//       },
//       //must apply paramenter for inkwell
//       splashColor: Theme.of(context).primaryColor,
//       borderRadius: BorderRadius.circular(16),
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         // Gradinet Box
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           gradient: LinearGradient(
//             colors: [
//               //category varible is of Category model class
//               category.color.withOpacity(0.55),
//               category.color.withOpacity(0.9),
//             ], //type list of colors
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         //widget which is inside of container
//         child: Text(
//           category.title,
//           style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                 color: Theme.of(context).colorScheme.onBackground,
//               ),
//         ),
//       ),
//     );
//   }
// }
