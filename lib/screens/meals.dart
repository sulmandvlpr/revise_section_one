//Display More List of meals  of Selected Category by on tap event on category_grid_item.dart
//display meal Data from meal.dart / data,model class
import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});
//appbar title define from outside
  final String? title;
//Meal from Meal.dart / model class
  final List<Meal> meals;

//display meal data
  @override
  Widget build(BuildContext context) {
    Widget content = Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Sorry Empty',
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'You selected empty category',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ],
    ));

    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) => Text(
                meals[index].title,
              ));
    }
//set condition if title is null we set content which contain title
    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
