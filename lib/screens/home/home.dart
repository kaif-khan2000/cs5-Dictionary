import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs5_dictionary/screens/home/doc_list.dart';
import 'package:cs5_dictionary/services/auth.dart';
import 'package:cs5_dictionary/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {

    return Container(
      child: StreamProvider<QuerySnapshot>.value(
          value: DatabaseServices().doc,
          child: DocList(),
      ),
    );
  }
}