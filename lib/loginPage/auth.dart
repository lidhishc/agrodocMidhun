import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

abstract class BaseAuth{
    Future<String> signInWithEmailAndPassword(String email,String password);  
    Future <String> creatUserWithEmailAndPassword(String email,String password);
    Future<FirebaseUser> currentUser();
    Future<void> signOut();
}

class Auth implements BaseAuth {

      Future<String> signInWithEmailAndPassword(String email,String password) async{
        AuthResult result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        FirebaseUser user = result.user;
        return user.uid;

      }
      Future <String> creatUserWithEmailAndPassword(String email,String password) async{
        AuthResult result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email, password: password);
        FirebaseUser user = result.user;
        return user.uid;
      }
      Future<FirebaseUser> currentUser() async{
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        return user;
      }
      Future<void> signOut() async{
        return await FirebaseAuth.instance.signOut();
      }

}