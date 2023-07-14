//with tab we switch to other screens
//tab screen we embadded orther screens
//contain scrrens for categores and favourite
//this must be stateful widget we upate the screen when we switch to other screen
import 'package:flutter/material.dart';
import 'package:revise_section_one/models/meal.dart';
import 'package:revise_section_one/screens/categories.dart';
import 'package:revise_section_one/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return TabsScreenState();
  }
}

class TabsScreenState extends State<TabsScreen> {
//index variablle to store current index
// we have 2 pages index 0 for first page and index 1 for 2nd
  int _selectedPageIndex = 0;

//method to updat the index and screen ui
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  //list variabl of store list of fav Meal
  final List<Meal> _favoriteMeal = [];

// method to set fav
  void _toggleFav(Meal meal) {
    final isExisting = _favoriteMeal.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    //inside build method we create a variable which holds and check which screen we current have
    Widget activePage = const CategoryScreen();

    if (_selectedPageIndex == 1) {
      activePage = const MealsScreen(meals: []);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('paceholder dynamiclay'),
      ),
      //body set dynamicaly based on what tab is pressed

      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        //this will only highlight the selected index
        currentIndex: _selectedPageIndex,

        //on tap this we update to diffrent screen
        //onTap recieves int value which we set as variable index
        //we set screens to int values and pass this int value as variale to onTap
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite'),
        ],
      ),
    );
  }
}
