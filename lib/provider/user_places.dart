//We want to have User Selected Data on multiple classes all over the app so we use RiverPod
//and make this User Seleted Input Data as State (provider state)
//this shoter the code as we pass Sleted Data parameter to diffrent classes and then accept on mutiplce classes
//we added our data here in addPlace method we also Store Data in Device from here

//Manage Places Selected by Users in add_places.dart screen as State
//becasuse we use this user selected Places alot of classes so we make it State and with help of Provider we will abaiable this state on difrent places
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

//a refefaece of taken image on file sytem
import 'dart:io';

//import model Class
import 'package:revise_section_one/models/place.dart';

//Notifier class -> add method which manuplate the state
class UserPlacesNotifier extends StateNotifier<List<Place>> {
  //Constructor with Initilizer List
  //super class have Initial List
  //here the inital List [] is set to const We never edit this State Object
  //so to edit this inital list we create New State Object
  UserPlacesNotifier() : super(const []);

//_getDatabase() I need top open again and again  the Database .openDatabase()
  Future<Database> _getDatabase() async {
//2 things  1get the path were we store database 2nd openDatabase
//it return Future
//dppath is directory were we will crate out database
    final dbpath = await sql.getDatabasesPath();
//openDatabase() open a database in provided path
//path we pass in para is not this dbpath but path we declare above on basename
//'places.db' here is Table name we can use any name
    final db = await sql.openDatabase(path.join(dbpath, 'places.db'),

        //fuction  db, version) {} is execute when db is created for first time
        onCreate: (db, version) {
      //return Future  Query
      //db.execute(sql query) .execute will sql query
      //user_places table name we can chose any table name
      //id TEXT PRIMARY KEY Colum with primary key which contain text
      //image is Text here cause i have save only path of image not entire file
      //for location Column we have lat and lng with doubel value (REAL)
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, lat REAL, lng REAL, address TEXT)');
    }, version: 1);
// now i also must return db
    return db;
  }

//loadPlace() for Getting Data back from SQL Database to app
//for that we need to open again  the data base .openDatabase()
//i craete _getDatabase() above and cut past .openDtabse , getDatabasesPath(); in it

  //type Future<void> cause loadPlace will return Future
  Future<void> loadPlace() async {
    //for that we need to open again  the data base .openDatabase()
    //when app start i need data to be there
    final db = await _getDatabase();
    //this time we calling the .quer() to get data back form database
    //as i want all data from database table so i just use .quer('table_name')
    final data = await db.query('user_places');
    //.query() also return type is Future so we use await to get response
    //also i need to format that that whcih which suits to app codtion
    //i my case i need data in from of List so i convet this data to list
    //I want to convert very row in this db Object to Place Object class
    //last i will save this Transfrom data/List<Map> in places variable
    final places = data
        .map(
          (row) => Place(
              id: row['id'] as String,
              title: row['title'] as String,
              image: File(row['image'] as String),
              location: PlaceLocation(
                  latitude: row['lat'] as double,
                  longitude: row['lng'] as double,
                  address: row['address'] as String)),
        )
        .toList(); // also convet .map Iteranble to List
    //title, image, location here is used of Table
    // table_name(id title TEXT, image TEXT,lng REAL, address TEXT)

//Remember That we are in UserPlacesNotifier which means we have to modify the state
//so we set the new state as this  places List<Map>
    state = places;
  }

  //method to add new places
  //method take title porperty of Place model as input
//now we have image ,side by side of title
  Future<void> addPlace(
      String title, File image, PlaceLocation location) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
//now we gona .copy() the File image to store it to new path  which is appDir but
//.copy() reqire String not Direcroy Object
//and newPath must include file name

//get file name we construct for that we use path package (import above) to
//construct us file name so we also import that

    final filename = path.basename(image.path);

    final copiedImage = await image.copy('${appDir.path}/$filename');

    //create new Place() modle  object and add to older list
    //repalce image with copiedImage
    final newPlace =
        Place(title: title, image: copiedImage, location: location);
    //now after coping image I want reach out sql db  to store data in Database

//this method create a path/directoyr to store db
    final db = await _getDatabase();

//after getting the database now we work with database
//now im gona insert my data in database
//table hers is user_places we define in  .execute with 'table_name'
//valuse here are Map<> key here is Coloumn name  id,title,lat
//Map<Column,values> values are value for that column so we set to new Map

    //this time we calling the .insert() to insert data to database
    db.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      //image property holds the path image.path
      'image': newPlace.image.path,
      'lat': newPlace.location.latitude,
      'lng': newPlace.location.longitude,
      'address': newPlace.location.address,
      //with that we Storing/Inserting all the data in Database
    });

    state = [newPlace, ...state];
  }
}

//now we also need to store data on device data like , title, image, location
//we stored image in File.path wich store image temprary when we restart app it will disappear
//path_provider package give us path for which store image perminitally image which is not gona delete my operating system

//1 path_provider package give us path for which store image perminitally image which is not gona delete my operating system

//2 path package which is similer but diffrent we need to Construct some path manally

//3(option 1)  sqflite package which allow us to Store data on device by using SQL Commands, it helh us //creating  sql database (advance)

//4 (option 2) shared_preferences package for Storing data on Deivce locally (basic onlly store key,value )

//flutter pub add path_provider

//flutter pub add path

//flutter pub add sqflite

//NotifierProvider will return us New Instance of UserPlaceNotfier() object
//we also set StateNotifierProvider to StateNotifierProvider<generic type>
final userPlaceProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
        (ref) => UserPlacesNotifier());
//Now we use this provider User Places  on alot of classes we we make this abailble to Main Class
//with Main class it will automatically availabe to alot of places in app
