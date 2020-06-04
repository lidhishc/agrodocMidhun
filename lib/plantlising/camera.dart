import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; //for capturing image from phone
import 'dart:io'; // for using file
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';
//import 'dart:convert'; // for converting to json

class Camera extends StatefulWidget {
  Camera({this.plantName});
  final String plantName;
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File _image;
  String resp = '';

  // for capturing image from camera
  Future getImageFromCam() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  // for capturing image from gallery
  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            child: Center(
              child: _image == null
                  ? Text('No image selected.')
                  : Image.file(_image),
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: getImageFromCam,
                    tooltip: 'Pick Image1',
                    child: Icon(Icons.add_a_photo),
                  ),
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: getImageFromGallery,
                    tooltip: 'Pick Image2',
                    child: Icon(Icons.wallpaper),
                  ),
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: () {
                      setState(() {
                        _image = null;
                      });
                    },
                    tooltip: 'Pick Image3',
                    child: Icon(Icons.delete),
                  ),
                  RaisedButton(
                    color: Colors.blueAccent,
                    onPressed: () {
                      uploadImageToServer(_image);
                    },
                    child: Text("Upload"),
                  )
                ],
              ),
            ],
          ),
          Container(
            child: Text(resp),
          ),
          Container(
            child: Text("${widget.plantName}"), // this will give which plant is selected
          )
        ],
      ),
    );
  }

  void uploadImageToServer(File imageFile) async {
    print("attempting to connect to server……");
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    print(length);
    var uri = Uri.parse('http://eae0b048.ngrok.io/predict');
    print("connection established.");
    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(
            imageFile.path)); //contentType: new MediaType(‘image’, ‘png’));
    request.files.add(multipartFile);
    print(multipartFile);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    this.resp = response.body.toString();
    print(response.body);
  }
}
