import 'dart:math';

import 'package:cs5_dictionary/screens/documents/documents.dart';
import 'package:cs5_dictionary/screens/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ModuleTile extends StatefulWidget {
  final String str;
  final List<dynamic> mod;
  ModuleTile({this.str,this.mod});
  @override
  _ModuleTileState createState() => _ModuleTileState();
}

class _ModuleTileState extends State<ModuleTile> {
  @override
  Widget build(BuildContext context) {

    
    return Container(

      decoration: BoxDecoration(
            color: Colors.blueGrey[900],
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0)
            ) 
          ),

      
      //color:Colors.blue,
      margin: EdgeInsets.only(top:20),
      //color: Colors.blueGrey[900],
      child: FlatButton(
          onPressed:() {
            Navigator.push(context,MaterialPageRoute(
              builder: (context) =>Documents(moduleNumber:widget.str,mod:widget.mod),
            ));        
          },
          child: Column(children: <Widget>[
          SizedBox(height: 8,),
          LayoutBuilder(
              builder: (context,Constraints){
                final radius = min(Constraints.maxHeight / 2, Constraints.maxWidth / 2);
                return CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage('assets/bg.jpeg'),
                  radius: radius,
                  child: Text(
                    widget.str,
                    style: TextStyle(
                      color: Colors.grey[100],
                      fontSize: 40,
                    ),
                  )
                );
              }
              
          ),
          
        ],),
      )
    );
  }
}