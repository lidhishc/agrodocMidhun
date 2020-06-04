import 'package:flutter/material.dart';
import 'package:project/plantlising/pepper.dart';
import 'package:project/plantlising/potato.dart';
import 'package:project/plantlising/tomato.dart';
import 'package:project/plantlising/navdrawer/contact.dart';
import 'package:project/plantlising/navdrawer/developer.dart';
import 'package:project/plantlising/navdrawer/help.dart';
import 'package:project/plantlising/navdrawer/history.dart';
//import 'package:project/plantlising/navdrawer/logout.dart';
import 'package:project/loginPage/auth.dart';

class Plant extends StatelessWidget {
  Plant({this.auth, this.onSignedOut});
  final BaseAuth auth; // necessary for signout
  final VoidCallback
      onSignedOut; //for informing rootpage that the app is signout

  void _signOut() async {
    try {
      await auth.signOut(); // signout function from auth.dart
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SELECT YOUR PLANT'),
        backgroundColor: Colors.green[600],
      ),
      drawer: Drawer(
          //navigation drawer
          child: Column(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green[600]),
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("Help"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Help()));
            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("Contact Us"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Contact()));
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Developers"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Developer()));
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("History"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => History()));
            },
          ),
          ListTile(
            leading: Icon(Icons.stop),
            title: Text("Logout"),
            onTap: _signOut,
          ),
        ],
      )),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(8.0, 140.0, 8.0, 8.0),
        child: Column(
          children: <Widget>[
            //for tomato
            SizedBox(height: 40.0),

            Container(
              padding: EdgeInsets.fromLTRB(10, 0.0, 0.0, 0),
              height: 40.0,
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.greenAccent,
                color: Colors.green[600],
                elevation: 7.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Tomato()),
                    );
                  },
                  child: Center(
                    child: Text(
                      'TOMATO',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
              ),
            ),

            //for potato

            SizedBox(height: 40.0),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0.0, 0),
              height: 40.0,
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.greenAccent,
                color: Colors.green[600],
                elevation: 7.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Potato()),
                    );
                  },
                  child: Center(
                    child: Text(
                      'POTATO',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
              ),
            ),

            //for pepper
            SizedBox(height: 40.0),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0.0, 0),
              height: 40.0,
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.greenAccent,
                color: Colors.green[600],
                elevation: 7.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Pepper()),
                    );
                  },
                  child: Center(
                    child: Text(
                      'PEPPER',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
