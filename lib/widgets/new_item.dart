// //display a form UI to add data like new items
// //when we click on add items button it will store data and show on gorcery_list class
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:revise_section_one/data/categories.dart';
// import 'package:revise_section_one/models/category.dart';
// import 'package:revise_section_one/models/grocery_item.dart';

// class NewItem extends StatefulWidget {
//   const NewItem({super.key});
//   @override
//   State<NewItem> createState() {
//     return _NewItemState();
//   }
// }

// class _NewItemState extends State<NewItem> {
//   //form always have build in key which is used in procss like validating form
//   final _formkey = GlobalKey<FormState>();

// //variabl to store enterd value instide TextFormField
//   var _enteredName = '';
//   var _enteredQuantity = 1;
//   var _selectedCategory = categories[Categories.vegetables]!;

// //method is valiate and save form data that we enterd as input
// //in this method now we gona store New gorceryItem and store this data in firebase
// //and also in this method we Nevigate to goracy List Screen after storing NewGoreacyItem in firebase
//   void _saveItem() async {
// //now we gona again create a gorcaery item from inside this saveitem method

//     //validtate here return bool value of true if value is valid or return error msg
//    //we warp validate method with if statment it will saves value OnlyIf validate is true
//    if( _formkey.currentState!.validate()){
//     _formkey.currentState!.save();
// //send data to server

// //creaet a Uri object with http constructor which takes firebase database address as Stg''
// // ,'shopping-list ' is node
// final  url = Uri.https('flutter-demo-learning-default-rtdb.firebaseio.com', 'shopping-list.json');

// final reponse =  await http.post(url,headers: {
//   'Content-Type' : 'application/json',
// },
//  //data/Object  we sent to database set to body parameter

// //data we send to database needed to be converted in json format
//  body: json.encode({

//   // we use map here caus json encode knows how to convert map to json
//     'name' : _enteredName,
//   //also we dont need to send id cause firebase do id stuff for us
//   'quantity' : _enteredQuantity,
//   'category' : _selectedCategory.title,
// }
// ),
// );

// print(reponse.body);
// print(reponse.statusCode);
//     // print(_enteredName);
//     // print(_enteredQuantity);
//     // print(_selectedCategory);

// //decode json to get name for Groayitem id
// final resData = json.decode(reponse.body);

//   //now again we naviagete back with data uplad to firebase

//       Navigator.of(context).pop();
//    }

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(

//         title: const Text('Add A New Item'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Form(
//             //to velidate the form we use key
//             key: _formkey,
//             child: Column(
//               children: [
//                 TextFormField(
//                   maxLength: 50,
//                   decoration: const InputDecoration(
//                     label: Text('Name'),
//                   ),
//                   //validaror validate the from input value is true or not
//                   //if the value is not validate it will return "Stg Error"
//                   //if the the input value is true than it will return null/nothing
//                   //value pass to validator is from flutter TextFromFiled
//                   validator: ((value) {
// //thats why we use if condition with or oprator
// //use || or oprator cause if any given condion is not true it will retun "Stg Erro"
//                     if (value == null ||
//                         value.isEmpty ||
//                         value.trim().length <= 1 ||
//                         value.trim().length >= 50) {
//                       return 'Must be btw 1 to 50 characters ';
//                     }
//                     return null;
//                   }
//                   ),
//                   onSaved: (value){
//                     _enteredName = value!;
//                   },
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         validator: (value) {
//                           if (value == null ||
//                               value.isEmpty ||
//                               int.tryParse(value) == null ||
//                               int.tryParse(value)! <= 0) {
//                             return 'Please Enter Valid number';
//                           }
//                           return null;
//                         },
//                         decoration: const InputDecoration(
//                           label: Text('quantity'),

//                         ),
//                         initialValue: _enteredQuantity.toString(),
//                         keyboardType: TextInputType.number,
//                       //onsave wil save form entered value
//                       onSaved: (value) {
//                         _enteredQuantity = int.parse(value!);

//                       },
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 8,
//                     ),
//                     Expanded(
//                       child: DropdownButtonFormField(
//                        //there is alwasy a value or from will not valid
//                         value: _selectedCategory,
//                         items: [
//                           for (final category in categories.entries)
//                             DropdownMenuItem(
//                               value: _selectedCategory,
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     width: 16,
//                                     height: 16,
//                                     color: category.value.color,
//                                   ),
//                                   const SizedBox(
//                                     width: 6,
//                                   ),
//                                   Text(category.value.title),
//                                 ],
//                               ),

//                             ),
//                         ],
//                         onChanged: (value) {
//                          //here we also update the ui so we call setState
//                           setState(() {
//                           _selectedCategory = value!;
//                           });

//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 12,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     TextButton(onPressed: () {
//                       _formkey.currentState!.reset();
//                     }, child: const Text('Reset')),
//                     ElevatedButton(
//                         onPressed: _saveItem, child: const Text('Add Item')),
//                   ],
//                 )
//               ],
//             )),
//       ),
//     );
//   }
// }
//👇👇👇

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:revise_section_one/data/categories.dart';
import 'package:revise_section_one/models/category.dart';
import 'package:revise_section_one/models/grocery_item.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;

//when we press button add item we need to wait for request to sending that's why we use isSending bool variable
//initly set to false cause when we are open this screen fist time ther is no request seding
  var _isSending = false;

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      //ater saving the form and before seding request to server we set isSending to ture and disable newItem button
      setState(() {
        _isSending = true;
      });

      final url = Uri.https(
          'flutter-prep-default-rtdb.firebaseio.com', 'shopping-list.json');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(
          {
            'name': _enteredName,
            'quantity': _enteredQuantity,
            'category': _selectedCategory.title,
          },
        ),
      );

      print(response.body);
      print(response.statusCode);

      // if (!context.mounted) {
      //   return;
      // }

//create GroceryItem in this SaveItem() method
//and send it to GoracyList class
//and on GrocaryList in _addItem() method with Navigate.push we save extra Get http request

//to create GorceryItem we need paramters like id,name,quanitiy
//we have other things but we don't have id
//for id we need to get respose id from json
      final Map<String, dynamic> resData = json.decode(response.body);
      Navigator.of(context).pop(GroceryItem(
          id: resData['name'],
          name: _enteredName,
          quantity: _enteredQuantity,
          category: _selectedCategory));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'Must be between 1 and 50 characters.';
                  }
                  return null;
                },
                onSaved: (value) {
                  // if (value == null) {
                  //   return;
                  // }
                  _enteredName = value!;
                },
              ), // instead of TextField()
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      keyboardType: TextInputType.number,
                      initialValue: _enteredQuantity.toString(),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'Must be a valid, positive number.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enteredQuantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedCategory,
                      items: [
                        for (final category in categories.entries)
                          DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.value.color,
                                ),
                                const SizedBox(width: 6),
                                Text(category.value.title),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    //if we are still sending the requset we must disable the button  to avoid sending another  request to server
                    onPressed: _isSending
                        ? null
                        : () {
                            _formKey.currentState!.reset();
                          },
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _isSending ? null : _saveItem,
                    child: _isSending
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(),
                          )
                        : const Text('Add Item'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
