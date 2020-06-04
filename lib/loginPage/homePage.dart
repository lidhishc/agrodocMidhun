import 'package:flutter/material.dart';
import 'auth.dart';

class HomePage extends StatelessWidget {

  HomePage({this.auth, this.onSignedOut});
  final BaseAuth auth;           // necessary for signout
  final VoidCallback onSignedOut; //for informing rootpage that the app is signout
  
  void _signOut() async {  
    try {
      await auth.signOut();     // signout function from auth.dart
      onSignedOut();      
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome Page'),
          actions: <Widget>[
          FlatButton(
              onPressed: _signOut,
              child: Text(
                "Logout",
                style: TextStyle(fontSize: 17.8, color: Colors.white),
              ))
        ],
        ),
        body: Container(
          child: Center(
            child: Text(
              'Welcome user',
              style: TextStyle(fontSize: 32.0),
            ),
          ),
        ));
  }
}
