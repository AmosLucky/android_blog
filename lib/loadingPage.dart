import 'package:flutter/material.dart';
class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: 
    Container(
      padding: EdgeInsets.only(top:12),
                          width: MediaQuery.of(context).size.width *0.9,
                          child: Column(children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left:30),
                                    height: 80,
                                    width:  MediaQuery.of(context).size.width *0.9,
                                    
                                    color: Colors.grey[300],
                                    child: Text("Flash News", 
                                    style: TextStyle(color: Colors.white70,fontSize: 50,),
                                    ),
                                    ),
                                    Container(
                                      color: Colors.grey[300],
                                      margin: EdgeInsets.only(top: 12.0),
                                      width:  MediaQuery.of(context).size.width *0.6,
                                      height: 50,
                                    ),
                                     Container(
                                      color: Colors.grey[300],
                                      margin: EdgeInsets.only(top: 12.0),
                                      width:  MediaQuery.of(context).size.width *0.9,
                                      height: 20,
                                    ),

                              Container(
                                      color: Colors.grey[300],
                                      margin: EdgeInsets.only(top: 12.0),
                                      width:  MediaQuery.of(context).size.width *0.9,
                                      height: 100,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text("Ensure your device is connected to the internet")

                                      ],),
                                    )

                            ],
                            ),
                            ),
                          Image.asset("assets/images/loading.gif",
                            width: 200,
                          ),
                           Container(
                            
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget>[
                                 Text("Designed By Lucky Amos"),
                               ],
                             ),
                                      color: Colors.grey[300],
                                      margin: EdgeInsets.only(top: 12.0),
                                      width:  MediaQuery.of(context).size.width *0.9,
                                      height: 50,
                                    )

                        ],
                        ),
                        ),
                        );
  }
}