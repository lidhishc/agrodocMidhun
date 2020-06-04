import 'package:flutter/material.dart';
import 'package:project/loginPage/auth.dart';
import 'package:connectivity/connectivity.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  _LoginPageState createState() => _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  String name;
  String _email;
  String _password;
  FormType _formType = FormType.login;
  final formkey = GlobalKey<FormState>();

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);


  bool validateAndSave() {
    final form = formkey.currentState;
    if(form.validate()) {
      form.save();
      print('Form is valid $_email and $_password and $name');
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async {
    var result = await Connectivity().checkConnectivity();
    if(result == ConnectivityResult.none) {
      _showDialog(
        'No Internet',
        "You're not connected to network"
        );

    } else if(validateAndSave()) {
      try {
        if (_formType == FormType.login) {
        // AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        // FirebaseUser user = result.user;
        // print('Signed in : ${user.uid}');
        String userId = await widget.auth.signInWithEmailAndPassword(_email, _password);
        print(userId);
        } else {
        // AuthResult result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        // FirebaseUser user = result.user;
        // print('Registered user  ${user.uid}');
        String userId = await widget.auth.creatUserWithEmailAndPassword(_email, _password); 
        print(userId);
        }
        widget.onSignedIn();
      } catch(e) {
        print('ERROR : $e');
      }

    }
  }

  void moveToRegister() {
     formkey.currentState.reset();
     setState(() {
      _formType = FormType.register;
    });
  }
  void moveToLogin() {
    formkey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 115.0, 0.0, 0.0),
                    child: Text(
                      'Hello',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                    child: Text(
                      'There',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                    child: Text(
                      '.',
                      style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),

            //form starting

            Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Form(
                 key: formkey,
                child: Column(
                  children: buildDetails() + buildInput() + buildSubmit(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildInput() {
    return [
      TextFormField(
        decoration: InputDecoration(
          labelText: 'EMAIL',
          labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
        ),
        validator: (value) => value.isEmpty ? 'This is empty' : null,
        onSaved: (value) => _email = value,
      ),

      //password field
      
      TextFormField(
        decoration: InputDecoration(
          labelText: 'PASSWORD',
          labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
        ),
        obscureText: true,
        validator: (value) => value.isEmpty ? 'This is empty' : null,
        onSaved: (value) => _password = value,
      ),

      SizedBox(height: 5.0),
    ];
  }

  List<Widget> buildSubmit() {
    if (_formType == FormType.login) {
      return [
        Container(
          alignment: Alignment(1.0, 0.0),
          padding: EdgeInsets.only(top: 15.0, left: 20.0),
          child: InkWell(
            child: Text(
              'Forgot Password',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  decoration: TextDecoration.underline),
            ),
          ),
        ),
        SizedBox(height: 40.0),
        Container(
          height: 40.0,
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Colors.greenAccent,
            color: Colors.green,
            elevation: 7.0,
            child: GestureDetector(
              onTap: validateAndSubmit,
              child: Center(
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'New to Agro Doc?',
              style: TextStyle(fontFamily: 'Montserrat'),
            ),
            SizedBox(width: 5.0),
            InkWell(
              onTap: moveToRegister,
              child: Text(
                'Register',
                style: TextStyle(
                    color: Colors.green,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ];
    } else {
      return [
        SizedBox(height: 15.0),
        Container(
          height: 40.0,
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Colors.greenAccent,
            color: Colors.green,
            elevation: 7.0,
            child: GestureDetector(
              onTap: validateAndSubmit,
              child: Center(
                child: Text(
                  'SIGNUP',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account?',
              style: TextStyle(fontFamily: 'Montserrat'),
            ),
            SizedBox(width: 5.0),
            InkWell(
              onTap: moveToLogin,
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.green,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(height: 15.0),
          ],
        ),
        SizedBox(height: 250.0),
      ];
    }
  }

  List<Widget> buildDetails() {
    if (_formType == FormType.register) {
      return [
        TextFormField(
          decoration: InputDecoration(
              labelText: 'NAME',
              labelStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green))),
          validator: (value) => value.isEmpty ? 'This is empty' : null,
          onSaved: (value) => name = value,
        ),
      ];
    } else {
      return [];
    }
  }

  //for checking interconnectivity
  // _checkInternetConnectivity() async{
  //   var result = await Connectivity().checkConnectivity();
  //   if(result == ConnectivityResult.none) {
  //     _showDialog(
  //       'No Internet',
  //       "You're not connected to network"
  //       );

  //   } else if (result == ConnectivityResult.mobile){
  //     _showDialog(
  //       'Internet access',
  //       "You're connected over mobile data"
  //       );
  //   } else if (result == ConnectivityResult.wifi) {
  //      _showDialog(
  //       'Internet access',
  //       "You're connected over wifi"
  //       );
  //   }
  // }

  //for showing dialog box
  _showDialog(title, text){
    showDialog(
      context: context,
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
      }
    );

  }
}

