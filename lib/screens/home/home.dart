import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs5_dictionary/models/user.dart';
import 'package:cs5_dictionary/screens/home/doc_list.dart';
import 'package:cs5_dictionary/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  User user;
  Home({this.user});
  
  @override
  Widget build(BuildContext context) {
    print("home:${user.email}");
    return Container(
      child: StreamProvider<QuerySnapshot>.value(
          value: DatabaseServices().doc,
          child: DocList(user: user,),
      ),
    );
  }
}