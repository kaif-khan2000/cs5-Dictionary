import 'package:cs5_dictionary/models/user.dart';
import 'package:cs5_dictionary/screens/authentication/authenticate.dart';
import 'package:cs5_dictionary/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class Wrapper extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    
    return user!=null ? Home(user: user,) : Authenticate(); // or Authenticate()
  }
}