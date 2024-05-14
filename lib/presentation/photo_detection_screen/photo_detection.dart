import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:travelbuddy2/core/app_export.dart';

import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';
import '../map_screen/map_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class PhotoDetectionScreen extends StatefulWidget {
  PhotoDetectionScreen({Key? key}) : super(key: key);

  @override
  _PhotoDetectionScreenState createState() => _PhotoDetectionScreenState();
}

class _PhotoDetectionScreenState extends State<PhotoDetectionScreen> {
  File? _image;
  List? _output;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      numThreads: 1,
    );
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 1,
        threshold: 0.2,
        asynch: true);
    setState(() {
      _loading = false;
      _output = output!;
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  pickImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return null;
    File file = File(image.path);

    setState(() {
      _loading = true;
      _image = file;
    });
    classifyImage(_image!);
  }

  captureImage() async {
    XFile? image2 = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image2 == null) return null;
    File file2 = File(image2.path);

    setState(() {
      _loading = true;
      _image = file2;
    });
    classifyImage(_image!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: pickImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color.fromARGB(255, 4, 199, 206), // Background color
                    padding: EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20), // Adjust padding
                  ),
                  child: Text(
                    'Upload',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: captureImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color.fromARGB(255, 4, 199, 206), // Background color
                    padding: EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20), // Adjust padding
                  ),
                  child: Text(
                    'Choose Image',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(70.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _image == null ? Container() : Image.file(_image!),
                      SizedBox(
                        height: 30,
                      ),
                      _image == null
                          ? Container()
                          : _output != null
                              ? Text(
                                  _output![0]["label"].toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                )
                              : Container(child: Text("")),
                      SizedBox(
                        height: 30,
                      ),
                      _image != null && _output != null
                          ? ElevatedButton(
                              onPressed: () {
                                if (_output != null && _output!.isNotEmpty) {
                                  _launchDirections(_output![0]["label"]);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(
                                    255, 4, 199, 206), // Background color
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 20), // Adjust padding
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/direction.png',
                                    height: 40.0,
                                    width: 40.0,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                      height:
                                          8.0), // Add some space between the image and the text
                                  Text(
                                    'Directions',
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// Method to open Google Maps with directions
  void _launchDirections(String label) async {
    double latitude = 0;
    double longitude = 0;

    // Set destination coordinates based on the label
    switch (label.toLowerCase()) {
      case 'sigiriya':
        latitude = 7.95486;
        longitude = 80.75459;
        break;
      case 'kandytemple':
        latitude = 7.29852;
        longitude = 80.64115;
        break;
      case 'lotustower':
        latitude = 6.92728;
        longitude = 79.85826;
        break;
      case 'majesticcity':
        latitude = 6.89424;
        longitude = 79.85466;
        break;
      case 'nelumpokuna':
        latitude = 6.91102;
        longitude = 79.86339;
        break;
    }

    final url =
        'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
