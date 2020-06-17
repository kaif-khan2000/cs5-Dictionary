import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs5_dictionary/models/user.dart';
import 'package:cs5_dictionary/screens/about/about.dart';
import 'package:cs5_dictionary/screens/chat/chat.dart';
import 'package:cs5_dictionary/services/auth.dart';
import 'package:cs5_dictionary/services/database.dart';
import 'package:cs5_dictionary/sharable/doc_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DocList extends StatefulWidget {
  User user;
  DocList({this.user});
  @override
  _DocListState createState() => _DocListState();
}

class _DocListState extends State<DocList> {
  final AuthService _auth = AuthService();


  DatabaseServices _database = DatabaseServices();

  @override
  Widget build(BuildContext context) {
    dynamic doclist;
    print('doclist:${widget.user.email}');
    doclist = Provider.of <QuerySnapshot>(context);
    int len = 0;
    List<dynamic> list;
    if(doclist!=null){
      for(var doc in doclist.documents){
        if(doc.data['uid'] == 'folders'){
          list =  doc.data['folders'];
        }
      }
      len = list.length;
      
    }
     

    return Scaffold(
          backgroundColor: Colors.blueGrey[800],
          
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[900],
            title: Text('Cs5 Dictionary'),
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                }, 
                color: Colors.blueGrey[700],
                icon: Icon(Icons.keyboard_return), 
                label: Text("logout",style: TextStyle(color: Colors.grey[400]),),
              ),
              SizedBox(width: 1,),
              FlatButton.icon(
                onPressed: () async {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => About(),
                  ));
                }, 
                color: Colors.blueGrey[700],
                icon: Icon(Icons.person), 
                label: Text("About",style: TextStyle(color: Colors.grey[400]),),
              ),

            ],
          ),
          body: GridView.count(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            crossAxisCount:2,
            crossAxisSpacing: 10,
            children: List.generate(len, (index) {
              return DocTile(str:list[index],doclist:doclist);
            }),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.blueGrey[900],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Material(
                    color: Colors.blue,
                    elevation: 6,
                    borderRadius: BorderRadius.circular(30),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Chat(user: widget.user,),
                        ));
                      },
                      minWidth: 200,
                      height: 60,
                      child: Text('KASE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
     );
  }
}