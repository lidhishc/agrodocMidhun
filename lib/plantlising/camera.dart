import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; //for capturing image from phone
import 'dart:io'; // for using file
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart' show DelegatingStream, Future;
import 'dart:convert'; // for converting to json
import 'package:connectivity/connectivity.dart';
import 'package:project/responseConverter/pasrseJson.dart';
class Camera extends StatefulWidget {
  Camera({this.plantName});
  final String plantName;
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File _image;
  String resp = '';
  var userName = 'lidhishc@flutter.com';
  var jsonResponse;
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
        backgroundColor: Colors.green[600],
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
                    backgroundColor: Colors.green[600],
                  ),
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: getImageFromGallery,
                    tooltip: 'Pick Image2',
                    child: Icon(Icons.wallpaper),
                    backgroundColor: Colors.green[600],
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
                    backgroundColor: Colors.green[600],
                  ),
                  RaisedButton(
                    color: Colors.green[600],
                    onPressed: () async {
                      if (_image != null) {
                        var result = await Connectivity().checkConnectivity();
                        if (result == ConnectivityResult.none) {
                          _showDialog(
                              'No Internet', "You're not connected to network");
                        } else {
                          uploadImageToServer(_image, userName);
                        }
                      } else {
                        _showDialog(
                            'No Image', "You need to select/capture a image");
                      }
                    },
                    child: Text(
                      "Upload",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Container(
                  child: Text("Result"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //for showing dialog box
  _showDialog(title, text) {
    showDialog(
        context: this.context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void uploadImageToServer(File imageFile, var usename) async {
    print("attempting to connect to server……");
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    print(length);
    var uri;
    if (widget.plantName == "tomato") {
      uri = Uri.parse('http://750340b068ce.ngrok.io/predicts');
    } else if (widget.plantName == "potato") {
      uri = Uri.parse('http://b9a7f529499d.ngrok.io/predicts');
    } else if (widget.plantName == "pepper") {
      uri = Uri.parse('http://b9a7f529499d.ngrok.io/predicts');
    }
    //var uri = Uri.parse('http://b9a7f529499d.ngrok.io/predicts');
    print("connection established.");
    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(
            imageFile.path)); //contentType: new MediaType(‘image’, ‘png’));
    request.files.add(multipartFile);
    request.fields['username'] = userName;
    print(multipartFile);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    jsonResponse=response.body;
    this.showJson();
  }

  // void uploadImageToServer(File imageFile) async {
  //   print("attempting to connect to server……");
  //   var stream =
  //       new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  //   var length = await imageFile.length();
  //   print(length);
  //   var uri = Uri.parse('http://eae0b048.ngrok.io/predict');
  //   print("connection established.");
  //   var request = new http.MultipartRequest("POST", uri);
  //   var multipartFile = new http.MultipartFile('file', stream, length,
  //       filename: basename(
  //           imageFile.path)); //contentType: new MediaType(‘image’, ‘png’));
  //   request.files.add(multipartFile);
  //   print(multipartFile);
  //   var streamedResponse = await request.send();
  //   var response = await http.Response.fromStream(streamedResponse);
  //   this.resp = response.body.toString();
  //   print(response.body);
  // }

Future showJson() async{
  final response = json.decode(this.resp);
  JsonConvertor jsonConvertor = new JsonConvertor.fromJson(this.jsonResponse);
  setState(() {
    this.resp=jsonConvertor.diseaseName;
  });
  


}

}
