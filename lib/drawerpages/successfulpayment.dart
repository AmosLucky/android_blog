import 'package:flutter/material.dart';
import 'package:luckyblog/main.dart';

class sucessfulPayment extends StatefulWidget {
  @override
  _sucessfulPaymentState createState() => _sucessfulPaymentState();
}

class _sucessfulPaymentState extends State<sucessfulPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Successsful payment"), centerTitle: true,
      ),

      body:Container(
        padding: EdgeInsets.only(top:30, left:20,right: 20),
        child: Column(children: <Widget>[
          Text("You have successfully paid for News Pay Advert.\n We will get back to you soon",
        style: TextStyle(fontSize: 18),),

        Padding(padding: EdgeInsets.only(bottom:50),),

        RaisedButton(
          textColor: Colors.white,
          color: Colors.blueAccent,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>mainHome()));

          },
          child: Text("GO TO HOME"),)

        ],)
    ));
  }
}