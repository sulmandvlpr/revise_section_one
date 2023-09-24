//places_list widget used in places.dart class , places_list widget used to show list of places
//here i want to render  user seleted place in my list
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:revise_section_one/models/place.dart';
import 'package:revise_section_one/provider/user_places.dart';
import 'package:revise_section_one/screens/places_detail.dart';

//convert StatelessWidget -> ConsumerWidget
class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});
  //craet a variable for places list which use List<ModelPlaces>
  final List<Place> places;
  @override
  //in build method now I also accept the WidgetRef as Parameter
  Widget build(BuildContext context) {
//if no place added yet
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No Places added yet',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) => ListTile(
        //now we gona show circle avatar with selected image
        leading: CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(places[index].image),
        ),
        //ListTile is optimmized to being use in List
        title: Text(
          places[index].title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        //show map address
        subtitle: Text(
          places[index].location.address,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),

        //ontap to Navigate to detail page
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => PlaceDetailScreen(place: places[index])),
            ),
          );
        },
      ),
    );
  }
}
