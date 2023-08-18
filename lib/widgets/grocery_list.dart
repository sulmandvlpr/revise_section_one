// //ui widget display grocerry list items  on screen
// //also show data which user enter via new_item class
// //_addItem() method is used to navigate to NewItem with help of press button in app bar
// //we also recive data from firebase in this file
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:revise_section_one/data/categories.dart';
// import 'package:revise_section_one/models/grocery_item.dart';
// import 'package:revise_section_one/widgets/new_item.dart';
// import 'package:http/http.dart' as http;

// class GroceryList extends StatefulWidget {
//   const GroceryList({super.key});

//   @override
//   State<GroceryList> createState() => _GroceryListState();
// }

// class _GroceryListState extends State<GroceryList> {
// //initially empty List of groccery Items
// //before that we use dummy grosery list item to dislay on screen now use user input list itme values
// //we set this List gorcayItem model  variable to initially empty list
//   List<GroceryItem> _grocesryItems = [];

// //loader variable initally true
// //we will set this variable to false when we have over data
//   var _isLoading = true;

// //we need to load data when we create the State first time
//   @override
//   void initState() {
//     super.initState();
//     _loadItems();
//   }

// //this method send and resvice requst to server and
// //display items from server when screen load up
//   void _loadItems() async {
// //getting data from server
//     final url = Uri.https('flutter-demo-learning-default-rtdb.firebaseio.com',
//         'shopping-list.json');

//     final response = await http.get(url);

//     //run app and debug consle prints the json format {"jlkdfjd": {"name" : "sam"} }
//     //json fomrat with key values key is Unique id strings and values is nested key,value pair

//     //now we use this respose data to Update UI
//     //now we wanat convert this json data back to regular dart object / dart maps
//     //we store this json resonse to listData{'':''} variabel  is a Map

//     final Map<String, dynamic> listData = json.decode(response.body);
//     //now futher we do is we  convert this Map{} data which is return from Server json to List<GorceryItem>
//     //now to convert map and nasted map to list we loop through every entity of map

//     //returnd nested map converted to tempary list in the future we convert it to List<GrcoeryItem>
//     final List<GroceryItem> loadedItems = [];

//     for (final item in listData.entries) {
//       //now inside of these map we have nested map and we convert these nested map to List<GroceryItem>

// //comparing category{map} with reciveed cagegory stg from server
//       final category = categories.entries
//           .firstWhere(
//               (catItem) => catItem.value.title == item.value['category'])
//           .value;

//       //we add new items in tempveray _loadedItems []
//       //we create new GorcaryItem object and add this server retun nested map to it
//       loadedItems.add(GroceryItem(
//           id: item.key,
//           name: item.value['name'],
//           quantity: item.value['quantity'],
//           category: category));
//     }
//     //replace the old List<GroceryItem> to temparery crated List<GroceryItem>
//     //and call setState to recrate build method and Update UI
//     setState(() {
//       _grocesryItems = loadedItems;
//       //now the loading is complate and we set isLaidng variable to false
//       _isLoading = false;
//     });

// //// final Map<String,dynamic>listData =  json.decode(response.body);
// //////now i want to convert this listData back to gorcerryList item
// ////// we loop throug ever map item in listData and convet to gorcaryitem

// ////    for(final item in listData.entries){
// ////    }
//   }

//   //_addItem() method is used to navigate to NewItem with help of press button in app bar
//   //this method suck in the new enter data from new Item class with Navigator.push
//   //we Navigaete back for new_item class  in this method
//   //Note when ever we want to get back data from screen B to A , we use Navigator on Screen B and set data there
//   //and on screen A we accept this data via Naviegetor Future async fun
//   void _addItem() async {
//     final newItem = await Navigator.of(context).push<GroceryItem>(
//         MaterialPageRoute(builder: (context) => const NewItem()));

// //now we dont need to load item when we add new item
// //and it will create a useless http request to add new item to list
//  _loadItems();

//     if (newItem == null) {
//       return;
//     }
// //update our state and add new item to that state
//     setState(() {
//       _grocesryItems.add(newItem);
//     });
//   }

//   void removeItem(GroceryItem item) {
//     setState(() {
//       _grocesryItems.remove(item);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget content = const Center(
//       child: Text('No Item added yet'),
//     );

//     if (_isLoading) {
//       const Center(
//         child: CircularProgressIndicator(),
//       );
//     }

//     if (_grocesryItems.isNotEmpty) {
//       ListView.builder(
//         itemCount: _grocesryItems.length,
//         itemBuilder: ((context, index) {
//           return Dismissible(
//             onDismissed: (direction) {
//               removeItem(_grocesryItems[index]);
//             },
//             key: ValueKey(_grocesryItems[index].id),
//             child: ListTile(
//               title: Text(
//                 _grocesryItems[index].name,
//               ),
//               leading: Container(
//                 width: 24,
//                 height: 24,
//                 color: _grocesryItems[index].category.color,
//               ),
//               trailing: Text(_grocesryItems[index].quantity.toString()),
//             ),
//           );
//         }),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('grocerry list items'),
//         actions: [
//           IconButton(onPressed: _addItem, icon: const Icon(Icons.add)),
//         ],
//       ),
//       body: content,
//     );
//   }
// }
//👇👇👇




















// pracitic mode
// //ui widget display grocerry list items  on screen
// //also show data which user enter via new_item class
// //_addItem() method is used to navigate to NewItem with help of press button in app bar
// //we also recive data from firebase in this file
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:revise_section_one/data/categories.dart';
import 'package:http/http.dart' as http;

import '../models/grocery_item.dart';
import 'new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {


  List<GroceryItem> _groceryItems = [];

//isLoadig bool to check if we are still loaidng to show spinner  once we load we update isLloading to false
var isLoading = true;

String? _error; 

//loads Item at time of class  instinciate  
  @override
  void initState() {
    super.initState();
    _loadItems();
  }

//loading data on render screen
  void _loadItems() async {
//fetching data from server
    final url = Uri.https(
        'flutter-prep-default-rtdb.firebaseio.com', 'shopping-list.json');
    final response = await http.get(url);
//checking error  before fetching data from backend
if(response.statusCode >= 400){
  setState(() {
  _error = "Faild to fetch data from server";  
  });
  
}    
    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];
    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
              (catItem) => catItem.value.title == item.value['category'])
          .value;
      loadedItems.add(
        GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category,
        ),
      );
    }
    setState(() {
      _groceryItems = loadedItems;
      //here we done with loading item so we set isLoadign to false  
      isLoading = false; 
    });
  }
//add item is method which take  back new entred item  from NewItem class with Navigator.push
  void _addItem() async {
   final newItem =  await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );

    //newItem can be null so check the null sefty
    if(newItem ==null){
      return;
    }
//if not null we will upate the ui state with newItem
setState(() {
  _groceryItems.add(newItem);
});

//we just getting NewItem locally from class not from server this will save extra get request  

//this loadItem() is taking memry cause data is back from other class Naivation by clikng on AddItem button
//this will make an extra http get request  
    //// _loadItems();
  }

//delete data from server 
  void _removeItem(GroceryItem item) async {

    //getting index of item from List 
    final  index = _groceryItems.indexOf(item);

//update the ui to show locally remove item before seding http 
    setState(() {
      _groceryItems.remove(item);
    });

    //set http requset to delete 
    //with delete request we also have id cause we want to del the speicif item from list  
     final url = Uri.https(

      //shopping-list/${item.id} inject list item varailble to String 
        'flutter-prep-default-rtdb.firebaseio.com', 'shopping-list/${item.id}.json'); 
 final  response =   await http.delete(url);

//if something went wrong I want to undo deletion 
  if(response.statusCode>=400){
    //caling setState again to update ui
    setState(() {
      _groceryItems.insert(index,item);
    });
  }
  
  }

  @override
  Widget build(BuildContext context) {

    Widget content = const Center(child: Text('No items added yet.'));
 
 //if error show error instead of content 
 if(_error != null){
content = Center(child: Text(_error!),);
 }
 
    //show difrent content if we are still loading newItem 
    if(isLoading){
       content = const Center(child: 
       CircularProgressIndicator());
    }

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) {
            _removeItem(_groceryItems[index]);
          },
          key: ValueKey(_groceryItems[index].id),
          child: ListTile(
            title: Text(_groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryItems[index].category.color,
            ),
            trailing: Text(
              _groceryItems[index].quantity.toString(),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
