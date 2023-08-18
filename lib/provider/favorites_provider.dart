// //static Provider
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:revise_section_one/models/meal.dart';

// //for dynamic/changeable values use StateNotifierProvider and StateNotifier

// class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
// //this class reqire 2 things
// //1 costructor with intial Value (inintal value is define in <generic type>)
// //2 methods which update the values of Provider
//   FavoriteMealsNotifier() : super([]);

//   void toogleMealFavoriteState(Meal meal) {
//     //this method will add the meal in list of we press toggle button
//     //and remove meal from list if it alray added to list
//     //we create a new List

//     final mealIsFavorite = state.contains(meal);

//     if (mealIsFavorite) {
//       state.where((m) => meal.id == meal.id).toList();
//     } else {
//       //... will contain the existing item in list a
//       state = [...state, meal];
//     }
//   }
// }

// final favoriteMealsProvider =
//     StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
//   return FavoriteMealsNotifier();
// });
