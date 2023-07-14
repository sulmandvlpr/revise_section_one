// main screen show grid layout
import 'package:flutter/material.dart';
import 'package:revise_section_one/data/dummy_data.dart';
import 'package:revise_section_one/models/category.dart';
import 'package:revise_section_one/screens/meals.dart';
import 'package:revise_section_one/widgets/categroy_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

//on tap of gradient box this will goto new screen
//this will exectued when we tap on CategoryGridItem class , gradinet box
//for that we need to pass this method to  CategoryGridItem class constructor
//📝 BuildContext we pass here by our self because we are in StateLessWidget

//we have to make sure we just pass data that belogn to that category
//we gona pass specific category model and its meals with we selected in  selectedCategory so we input the Category in it
  void _selectCategory(BuildContext context, Category category) {
//we want to display list of meals which belongs to that category ony
//so we filter the meal list and get the meals which belong to that cateogry

//for filter we use list.where which return true or false or condintion
//we need to get the categories from meal list
//so we apply meal list.contain(element id) to check if it conatiner that category id
//.toList cause where return type is Iterable so we convert to list
    final filtermeal = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

//Navigate to diffrent screen
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MealsScreen(
                title: category.title, //we give title which category it belong
                meals: filtermeal)));
  }

  @override
  Widget build(BuildContext context) {
    return
        //grid layout to dispay mulitple categories with data
        GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      //display Categories Widget in gird  on screen
      children: [
        //loop throuh every category Data from data/model dummy_data.dart
        for (final category in availableCategories)
          //output single gird item View/ box design
          //and output catgory as singl category with category_grid_item View
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          ),
      ],
    );
  }
}
