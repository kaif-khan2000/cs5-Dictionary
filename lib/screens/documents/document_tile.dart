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





