import 'package:flutter/material.dart';
import 'package:luckyblog/drawerpages/paymentPage.dart';
import 'package:luckyblog/main.dart';

class failedPayment extends StatefulWidget {
  @override
  _failedPaymentState createState() => _failedPaymentState();
}

class _failedPaymentState extends State<failedPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" Payment Failed"), centerTitle: true,backgroundColor: Colors.redAccent,
      ),

      body:Container(
        padding: EdgeInsets.only(top:30, left:20,right: 20),
        child: Column(children: <Widget>[
          Text("Your payment was not successful.\n Please Try Again",
        style: TextStyle(fontSize: 18),),

        Padding(padding: EdgeInsets.only(bottom:50),),

        RaisedButton(
          textColor: Colors.white,
          color: Colors.blueAccent,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>mainHome()));

          },
          child: Text("GO TO HOME PAGE"),)

        ],)
    ));
  }
}