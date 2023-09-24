//show location of user in add_places.dart file
//Prview /display Image/screenshot  of map with google map static api
//get current location of user google Geocoding api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:revise_section_one/models/place.dart';
import 'package:revise_section_one/screens/maps.dart';

class LocationInput extends StatefulWidget {
  LocationInput({super.key, required this.onSelectLocation});
  final void Function(PlaceLocation location) onSelectLocation;

  @override
  State<StatefulWidget> createState() {
    return LocationInputState();
  }
}

class LocationInputState extends State<LocationInput> {
  //while featching the map data / locaiton we show loader spinnner

  //Location? here is comming from Package Location which we added from lib code
  //now we gona change Location? to PlaceLocation?
  //PlaceLocation is Model we set this to _pickedLocation variable
  PlaceLocation? _pickedLocation;
  //once we are geting loccation we set this to false
  var _isGettingLocaiton = false;

  //using google map static  api to get the image of map
  String get locationImage {
    if (_pickedLocation == null) {
      return '';
    }
    final lat = _pickedLocation!.latitude;
    final lng = _pickedLocation!.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng,NY&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:S%7C$lat,$lng&key=YOUR_API_KEY';
  }

  // we again get  Url address and LanLog  and update the state for pickedLocation varaible with new LanLog address
  //to avoiding copy and pasting we insted create a new method _savePlace(takes ,lan,lng)
//now this _savePlace is Return Type is Future<>
  Future<void> _savePlace(double latitude, double longitude) async {
    final url = Uri.parse(
        //update lat and lng with latitude,longitude which pass outside

        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${latitude},${longitude}&key=YOUR_API_KEY');
    final response = await http.get(url);
    final resData = json.decode(response.body);
    final address = resData['results'][0]['formatted_address'];

//now the goal is to save this address and lat log in Object which we can later use in other places like place_detail screen

//before setting _isgetting location back to false we do this

    setState(() {
      //when done with  getting location set this back to false
      //update ui with  _pickedLoccation
      _pickedLocation = PlaceLocation(
          latitude: latitude, longitude: latitude, address: address);
      _isGettingLocaiton = false;

      //after getting location use widget.onSelectLocation
      widget.onSelectLocation(_pickedLocation!);
    });
  }

  void _getCurrentLocation() async {
//this code below check wether the services avaialble and we
//have permission to use location

    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

//that LocationData Oject give us Object proverty Languature and longitude which we
//use to get location and use location data later in human read able way
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();

      if (serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
    }
    if (permissionGranted != PermissionStatus.granted) {
      return;
    }

//calling getting location  before getLocaiton()
    setState(() {
      //when we start getting lcoaiton we update _isGetting to yes we are getting
      _isGettingLocaiton = true;
    });

    locationData = await location.getLocation();

//after picking the location I also want to send this request and
//translate this location to huamn readable address
//for that we need to send http request
//isntall http in termial and import http package as http

    final lat = locationData.latitude;
    final lng = locationData.longitude;

    if (lat == null || lng == null) {
      return;
    }

//we have location Data now we need to do is to convet this .langitude and
//.longitude to human readable way
//and we want to generate google map screenshot to display on Container preivew  below
//for that we use Google Maps API

    print(locationData.latitude);
    print(locationData.longitude);

//we cut lan,lng and address and get address Uri method and past in _savePlace() and call this here and selectOnMap()method
    _savePlace(lat, lng);
  }

//we revcie _pickLocation back from MapScreen and it make time for user to select the location so we use async
//as we use Future .push() fun so we have extra ability to to set  push<generictype> to get expact data back
//.push<LatLng> is import from google/flutter
  void _selectOnMap() async {
    final pickedLocation = await Navigator.of(context)
        //were on MapScreen() we dont use paramter cause Parametnser in MapScreen() class have defulat value
        .push<LatLng>(
      MaterialPageRoute(
        builder: (context) => MapScreen(),
      ),
    );
    if (pickedLocation == null) {
      return;
    }
    //but if location is not null we used that location
    //how we gona use this location
    // we again get  Url address and LanLog  and update the state for pickedLocation varaible with new LanLog address
    //to avoiding copy and pasting we insted create a new method _savePlace(takes ,lan,lng)
    _savePlace(pickedLocation.latitude, pickedLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
      "No location Chossen",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
    );

//if user picked location is not null means user pick a location then we set this location to preivew/display mpa image
    if (_pickedLocation != null) {
      previewContent = Image.network(
        locationImage,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }

    if (_isGettingLocaiton) {
      previewContent = const CircularProgressIndicator();
    }

    return Column(
      //multiple widget above each other so column
      children: [
        //container for preview of places
        Container(
            alignment: Alignment.center,
            height: 107,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.2)),
            ),
            //now rendred conditionally spinner or txt
            child: previewContent),
        //2 buttons side by side
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //buton 1 selete user location automacially
          //btn 2 open map and user select  location Manally
          children: [
            //btn1
            TextButton.icon(
              icon: const Icon(Icons.location_on),
              label: const Text("Get Current  Location"),
              //to get user location we create method and call here on button
              onPressed: _getCurrentLocation,
            ),
            //btn2 //select this from map open new screen maps
            //with map screen we _pickedLocation and come back with _pickLocation
            //make a method _selectOnMap to recive _pickeLocation
            TextButton.icon(
              icon: const Icon(Icons.map),
              label: const Text("Select on Map"),
              onPressed: _selectOnMap,
            ),
          ],
        ),
      ],
    );
  }
}
