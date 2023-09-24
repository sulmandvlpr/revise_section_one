//screen of Add New place  when user click on add button on places screen
//when user add data we Navigate back to places screen with user data
//here in this file i gona use userSelectedPlace provider
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:revise_section_one/models/place.dart';
import 'package:revise_section_one/provider/user_places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revise_section_one/widgets/image_input.dart';
import 'package:revise_section_one/widgets/location_input.dart';
//we gonnna accept File here which is send by image_imput
//we forward the image we seletecd
//to get here we need to add image in AddPlaceState in ImageInput(),Widget

//class here is Stateful caus I have to manage some User experince
class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
//with the help of TextEditingController flutter manage contorller for me
//and i use this _titleController to store and handle user input text later
  final _titleController = TextEditingController();

  //for Accepting _selectImage from image_input class
  File? _selectImage;
//Accepting _selectdLocation from location_input class
  PlaceLocation? _selectedLocation;

  //Accectiong _sletedLocation from location_input class

//in this method  i gona use userSelectedPlace provider
  void _savePlace() {
    //i am gona take user Enter text which is save in _titlController() Object  and save as variable
    //and set to PlaceProvider
    final entredTitle = _titleController.text;
//some validation before saveing text
    if (entredTitle.isEmpty ||
        _selectImage == null ||
        _selectedLocation == null) {
      return;
    }

//ref property  is avaible use we use ConsumerState and ref is State property
//ref.read(provider.notifier).NotifierClassMethod(input)
    ref
        .read(userPlaceProvider.notifier)
        .addPlace(entredTitle, _selectImage!, _selectedLocation!);
//after that we Navigate away from this screen
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            //for now use TextFiled insted of Form simple to rending text input element that allows user to enter tilte
            //later i allow user to pick an image and chose location for now just tilte i need
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            //Image Input
            //we got no Image input machanicaizm so we gona make our own by creating widgte image_input.dart
            const SizedBox(
              height: 10,
            ),
            ImageInput(
              onPickImage: (image) {
                _selectImage = image;
              },
            ),
            const SizedBox(
              height: 10,
            ),
//MapScreen
            LocationInput(
              onSelectLocation: (location) {
                _selectedLocation = location;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            //button to save my form data
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              onPressed: _savePlace,
              label: const Text('Save Place'),
            )
          ],
        ),
      ),
    );
  }
}
