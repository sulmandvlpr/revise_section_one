//screen shows  List[]  of places  which we added from add_places class
//in this class we laod placesList data from database
import 'package:flutter/material.dart';
import 'package:revise_section_one/screens/add_places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revise_section_one/provider/user_places.dart';
import 'package:revise_section_one/widgets/places_list.dart';

//convert StatelessWidget -> ConsumerStatefulWidget
class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PlacesScreenState();
  }
}

class _PlacesScreenState extends ConsumerState<PlacesScreen> {
//use Late to initilze this property when require not initilize with
//class creation constructor
  late Future<void> _placeFuture;

//initilze State gives initiial(when state starting) Value to State
//some time we need to give value when state is start
  @override
  void initState() {
    super.initState();
//now im givieng value to late class initilzer
//I need to give value when state is start not when class is start
//and the value is set is to _placeture .read()
//.loadPlaces() behid the scean load the data from database
//and update the state of provider
    _placeFuture = ref.read(userPlaceProvider.notifier).loadPlace();
  }

  @override
  //in build method now I don't accept the WidgetRef as Parameter it is
  //now buildin in CounsumerState as ref property

  Widget build(BuildContext context) {
//store this watcher to userPlaces()
    //🧾now dart thing it is normal storage vairable but this is
    //our method wich is used in UserPlacesNotifier class As method of Modifing State
    //to tell dart this is not a normal storge vaiable but Notifer Class method we
    //we gona tell set StateNotifierProvider<generic> to generic type
    // final userPlaceProvider  = StateNotifierProvider<UserPlacesNotifier, List<Place>>
    final userPlace = ref.watch(userPlaceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places List'),
        //button to navigate to add_places screen
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddPlaceScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        //now we gona show places List from Database
        //future Builder takes future and Builds the Widget Tree After this future give Response
        //this snapshot pare will gives you status of future
        child: FutureBuilder(
          future: _placeFuture,
          builder: (context, snapshot) =>
              //conttingStats = wating then show loading spineer
              //in case it loads then we show Widget
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : PlacesList(
                      //replace [] ititally empty list with
                      places: userPlace,
                    ),
        ),
      ), //widget places_list which display list of places
    );
  }
}
