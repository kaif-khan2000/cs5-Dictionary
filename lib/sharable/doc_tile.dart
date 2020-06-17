import 'dart:math';
import 'package:cs5_dictionary/screens/modules.dart';
import 'package:cs5_dictionary/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DocTile extends StatefulWidget {
  final String str;
  final dynamic doclist;
  DocTile({this.str,this.doclist});
  @override
  _DocTileState createState() => _DocTileState();
}

class _DocTileState extends State<DocTile> {
  DatabaseServices _auth = DatabaseServices();
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
          onPressed:()  {
            String pass = widget.str;
            
            var route = new MaterialPageRoute(
              builder: (context) => new Module(pageName:pass,doclist: widget.doclist,),
            );
            Navigator.of(context).push(route);
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
          ],
        ),
      )
    );
  }
}