//Screen which show detail of place by clicking listview of places_list class
import 'package:flutter/material.dart';
import 'package:revise_section_one/models/place.dart';
import 'package:revise_section_one/screens/maps.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});
  //model Place
  final Place place;

//getting google map static api for showing snapshot of  map image
  String get _locationImage {
    final lat = place.location.latitude;
    final lng = place.location.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center${lat},${lng}&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C40.718217,-73.998284&key=YOUR_API_KEY&signature=YOUR_SIGNATURE';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(
        children: [
          //start stack with botom most widget
          Image.file(
            //File here is model place.proteryimage
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          //positined things above the other things like postion image on this place image
          Positioned(
              //postion set
              bottom: 0,
              left: 0,
              right: 0,
              child:
                  //colum we have 1 cirlce image and beneth that a Textd
                  Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      //on click we go to map screen
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          //isSletcting set to false cause we are not selcting new locaion here
                          builder: (BuildContext context) => MapScreen(
                            location: place.location,
                            isSelecting: false,
                          ),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(_locationImage),
                    ),
                  ),
                  Text(
                    place.location.address,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
