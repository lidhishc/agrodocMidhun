import 'package:flutter/material.dart';
//import 'package:project/loginPage/homePage.dart';
import 'package:project/plantlising/plantlis.dart';
import 'auth.dart';
import 'package:project/loginPage/login.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});
  final BaseAuth auth;
  @override
  _RootPageState createState() => _RootPageState();
}

enum AuthStatus { notSignedIn, signedIn }

class _RootPageState extends State<RootPage> {
  AuthStatus _authStatus = AuthStatus.notSignedIn;

  @override
  void initState() {
    super.initState();
    widget.auth.currentUser().then((userId) {
      setState(() {
        _authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }

  void _signedIn()
  {
        setState(() { 
          _authStatus = AuthStatus.signedIn;
        });
  }

  void _signedOut()
  {
        setState(() { 
          _authStatus = AuthStatus.notSignedIn;
        });
  }

  @override
  Widget build(BuildContext context) {
    switch (_authStatus) {
      case AuthStatus.notSignedIn:
        return LoginPage(auth: widget.auth, onSignedIn: _signedIn);
        break;
      case AuthStatus.signedIn:
        return Plant(
          auth: widget.auth,
          onSignedOut: _signedOut,
        );


        break;
    }
  }
}
