import 'package:cs5_dictionary/screens/documents/document_tile.dart';
import 'package:flutter/material.dart';

class Documents extends StatelessWidget {
  final String moduleNumber;
  final List<dynamic> mod;
  Documents({this.moduleNumber,this.mod});
  @override
  Widget build(BuildContext context) {
    print(mod);
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text("Module $moduleNumber"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: mod.length,
        itemBuilder: (context,index) => Card(
          child: DocumentTile(docs: mod[index],),
        ),
      ),
    );
  }
}