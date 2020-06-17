import 'package:cs5_dictionary/models/user.dart';
import 'package:cs5_dictionary/screens/wrapper.dart';
import 'package:cs5_dictionary/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),    
      ),
    )??Scaffold(
      body:Text('Something went wrong'),
    );
  }
}

