//this screen class open Map to so user can select location
//file open from clicking on select map from places_detail circlre avator image .dart file
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:revise_section_one/models/place.dart';

//stateful cause i want to pick a place
//and by default show picked location
class MapScreen extends StatefulWidget {
//here i set default location if any location is not set or i am opening map for fist time then i use to show dufalt location

  MapScreen({
    super.key,
    this.location = const PlaceLocation(
      latitude: 34.422,
      longitude: -122.084,
      address: 'address',
    ),
    this.isSelecting = true,
  });

  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() {
    return _MapScreenState();
  }
}

class _MapScreenState extends State<MapScreen> {
//I set variable for LatLog this picked
//I update this LatLan when we selct new pickedlocation
  LatLng? _pickedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //show title with current locaiton if select or show 'pick your location'
        title:
            Text(widget.isSelecting ? 'Pick your location' : 'your Location'),
        actions: [
          //button allow user to save picked location
          if (widget.isSelecting)
            IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  //on clicking the save button we pass back ->Navigt back with _pickedLocation
                  Navigator.of(context).pop(_pickedLocation);
                }),
        ],
      ),
      body: GoogleMap(
        //position parmeter here is varible type of LagLan
        //once we clik on save this postion we take back this position to places_detail screen

        //also if isSeleting is false case we are not selcint then we set Tap to null so it is not able to selct
        onTap: !widget.isSelecting
            ? null
            : (position) {
                //when user select the postion we update the LatLng to latest positon
                setState(() {
                  _pickedLocation = position;
                });
              },
        initialCameraPosition: CameraPosition(
            target: LatLng(widget.location.latitude, widget.location.longitude),
            zoom: 16),
//now if we dont hvae picked locaiton yet we show marker empty set {}
        markers: (_pickedLocation == null && widget.isSelecting)
            ? {}
            : {
                //marker shows red location icon on seletd location
                Marker(
                  markerId: const MarkerId('M1'),
                  //?? set position to  _pickedLocation if it is not null if it is null then set postion to  LatLng
                  position: _pickedLocation ??
                      LatLng(
                          widget.location.latitude, widget.location.longitude),
                ),
              },
      ),
    );
  }
}
