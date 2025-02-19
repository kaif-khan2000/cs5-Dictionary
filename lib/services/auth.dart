import 'package:cs5_dictionary/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //user From firebase user
  User _userFromFirebaseUser(FirebaseUser user){
    
    return user!=null ? User(uid:user.uid,email:user.email) : null;
  }
  
  //user stream
  Stream<User> get user {

    return _auth.onAuthStateChanged
            .map(_userFromFirebaseUser);

  }

  //sign in anonymously

  Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  
  
  //sign in with Email password
  Future signInWithEmailAndPassword(String email,String password) async {
    try{

     AuthResult result = await _auth.signInWithEmailAndPassword(email: email.trim(), password: password);
     FirebaseUser user = result.user;
     return _userFromFirebaseUser(user); 
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  
  
  //register with Email and Password
  Future registerWithEmailAndPassword(String email,String password) async {
    try{

     AuthResult result = await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password);
     FirebaseUser user = result.user;
     return _userFromFirebaseUser(user); 
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  
  
  //sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }


}