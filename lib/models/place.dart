import 'package:uuid/uuid.dart';
//a refefaece of taken image on file sytem
import 'dart:io';

const uuid = Uuid();

//create another model for Place locaiton
//i want to save location just like i save image and tilte in Place
class PlaceLocation {
  const PlaceLocation(
      {required this.latitude, required this.longitude, required this.address});
  final double latitude;
  final double longitude;
  final String address;
}

class Place {
  Place({
    required this.title,
    required this.image,
    required this.location,
    String? id,
  }) : id = id ?? uuid.v4();
//inside initilizer list : id the id = id(this id is Plce(id) and if it is NULL then i use uuid()) which i represent as ??

  final String id;
  final String title;
  //a refefaece of taken image on file sytem
  final File image;
  final PlaceLocation location;
}
