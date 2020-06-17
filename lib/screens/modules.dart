//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs5_dictionary/sharable/module_tile.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class Module extends StatefulWidget {
  final String pageName;
  final dynamic doclist;
  Module({this.pageName,this.doclist});
  
  @override
  _ModuleState createState() => _ModuleState();
}

class _ModuleState extends State<Module> {


  @override
  Widget build(BuildContext context) {

    Map<String,dynamic> mod;
    for(var doc in widget.doclist.documents){
      if(doc.data['uid'] == widget.pageName){
        mod = doc.data;
        //print(mod['1'].length);
      }
    }
    List modules = [1,2,3,4,5,'TB','QP','Assign'];
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          widget.pageName,
          style: TextStyle(
            letterSpacing: 2,
            fontSize: 25
          ),
        ),
        centerTitle: true,
      ),
      body:GridView.count(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            crossAxisCount:2,
            crossAxisSpacing: 10,
            children: List.generate(modules.length, (index) {
              return ModuleTile(str:modules[index].toString(),mod: mod[modules[index].toString()],);
            }),
      ),
    );
  }
}