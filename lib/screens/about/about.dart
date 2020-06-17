import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text("About"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Developed By:",
                  style: TextStyle(
                    fontSize: 20,
                  ),  
                ),
                SizedBox(width: 10,),
                Text(
                  "P Kaif Ali Khan",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    fontSize: 22,
                  ),  
                ),
              ],              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Purpose:",
                  style: TextStyle(
                    fontSize: 20,
                  ),  
                ),
                SizedBox(width: 10,),
                Text(
                  "Educational",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    fontSize: 22,
                  ),  
                ),
              ],              
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "University:",
                  style: TextStyle(
                    fontSize: 20,
                  ),  
                ),
                SizedBox(width: 10,),
                Text(
                  "Gitam Hyderabad",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    fontSize: 22,
                  ),  
                ),
              ],              
            ),
            SizedBox(height: 15,),
            Text('This App is for total educational purpose.\nA new feature'+
              ' is added to this app known as KASE.\nKASE stands for "Kaif\'s Application for Statement Exchange."\nWith this you can able to share Statements(Chat) with your friends(Classmates).',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}