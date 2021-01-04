import 'package:flutter/material.dart';
import 'main.dart';

void main() => runApp(splashScreen());
class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 2),
      (){
       Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>mainHome()));
      }

    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/icon.png"),
            Text("Flash News ",style: 
            TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
            )
          ],
        )
      ),
      )
      
      
    );
  }
}

