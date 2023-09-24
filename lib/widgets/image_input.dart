//Shows Image Input UI used inside add_places.dart screen
//here  1st we add code to allow user to open device camera and take picture
//2nd show preivew of image which was taken
//3rd pass this image back to add_places.dart screen so there to place detail screen
//4th add this picture to  model place.dart and riverpod places_list.dart

//🧾after using some Native Device Feature we shold restart or rebild the project/ide
//update ui and manage some state so stateful
import 'dart:io';

import 'package:flutter/material.dart';
//we gona use library by pub.dev image_picker
//import use ImagePicker Class and pickImage()method
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPickImage});

  final void Function(File image) onPickImage;

  @override
  State<StatefulWidget> createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
//set File/Dart.IO class (for Native Device Feature File) with varible _sletecImage
//also File can be null so File?
  File? _selctedImage;

//in that case we show image and i replace text button "Take Picture" with image preview
//step 1
//to take picture from Deviec Camera  I create a method
  void _takePicture() async {
    //want to open camera and take image for that
    //Create class ImagePicker() and store to imagepicker
    final imagepicker = ImagePicker();

    //pickImage()method of ImagePicker Object return type is Future<pickedFile/XFile>
    //pickImage()method takes paramets (ImageSource.camera)
    //here the pickedImage is the Image we picked as response

    //maxWidth to reduc the size of image if image is super large
    // which take long time load
    final pickedImage =
        await imagepicker.pickImage(source: ImageSource.camera, maxWidth: 600);

    //there is chances that user open camera but don't take picture
    //and close camera So we use NULL check
    if (pickedImage == null) {
      return;
    }
//step 2
//now i have to preview seltecd Image with File Dart.io
//and set pickedImage to File / Device Storage system
//file_variable = FileObj(pickedImage.propertypath);
//pickedImage.path cause we take image which store on path
//path is locaton where we Store image in mobile Device
//set state to show pickedimage on UI
    setState(() {
      _selctedImage = File(pickedImage.path);
    });
    //pickImage which we send to other class with constructor fun as fun is set here in setState
    //to update ui with user picked image
    widget.onPickImage(_selctedImage!);
  }

  @override
  Widget build(BuildContext context) {
//I have button (seletcImaege) which i gona replace conditionally
//with preview of Image
    Widget content = TextButton.icon(
        icon: const Icon(Icons.camera),
        label: const Text("Take Picture"),
        onPressed: _takePicture);

//now if we picked image next is to show on container
//for that we use Image Construcotr with enum file
    if (_selctedImage != null) {
      //tap to retake image
      //warp Image with gestureDecture onTap
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          _selctedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      );
    }
    //container suit for decorations
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
        ),
        height: 250,
        width: double.infinity,
        alignment: Alignment.center,
        child: content
        //button or privewimage
        //rendered button conditionally

        );
  }
}
