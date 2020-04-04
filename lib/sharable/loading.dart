import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Loading.."),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Container(
        padding: EdgeInsets.symmetric(vertical:100,horizontal:20),
        color: Colors.blueGrey[100],
        child: Center(
          child: Column(
            children: <Widget>[
              SpinKitChasingDots(
                color: Colors.blueGrey[900],
                size: 50.0,
              ),
              SizedBox(height:30),
              Text("Loading.. \nTakes few momments",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}