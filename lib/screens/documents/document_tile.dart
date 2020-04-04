//import 'dart:io';

import 'package:cs5_dictionary/screens/documents/open_pdf.dart';
//import 'package:cs5_dictionary/screens/documents/pdf_services.dart';
//import 'package:cs5_dictionary/sharable/loading.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class DocumentTile extends StatefulWidget {
  final Map<dynamic,dynamic> docs;
  
  DocumentTile({this.docs});
  @override
  _DocumentTileState createState() => _DocumentTileState();
}

class _DocumentTileState extends State<DocumentTile> {
  
  
  @override
  Widget build(BuildContext context) {
    Map<dynamic,dynamic> docs = widget.docs;
    
    return Container(
      color: Colors.blueGrey[800],
        padding: EdgeInsets.only(top:10),
       height: 80,
      
        child:FlatButton(
            onPressed: () async  {
              String url = docs['link'];
              launch(url);
              // if(docs['link'] != "" && docs['link'] != null){
              //   String path;
                
                
              //  try{
              //   Navigator.push(context,MaterialPageRoute(builder: (context) => OpenPdf(url: docs['link'],docName: docs['name'],),));
              //  }catch(e){
              //    print(e.toString());
              //  }
                
              // }
            },
            child: ListTile(
            leading: CircleAvatar(
              child: Image(
                image: AssetImage("assets/pdf.png"),
              ),
              radius: 25,
              backgroundColor: Colors.blueGrey[900],
            ),
            title: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(docs['name'],
                
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 20,
                ),
              ),
            ),
            
          ),
        ),
       
       
    );
  }
}





