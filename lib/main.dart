import 'dart:ui' as prefix2;

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix1;
import 'package:flutter/rendering.dart';
import 'package:luckyblog/drawerpages/advertpage.dart';
import 'package:luckyblog/drawerpages/contact.dart';
import 'package:luckyblog/pages/CelebrityPage.dart';
import 'package:luckyblog/pages/FootballPage.dart';
import 'package:luckyblog/pages/gossips.dart';
import 'package:luckyblog/pages/home.dart';
import 'package:luckyblog/pages/trendingPage.dart';
import 'package:url_launcher/url_launcher.dart'as url;
void main() => runApp(mainHome());

/// commented out
class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  bool splashDone = false;
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 3),
      (){
        setState(() {
          splashDone = true;
        });
        
      }

    );
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: prefix1.Scaffold(
        backgroundColor: Colors.blueAccent,
        body: splashDone? mainHome():
         prefix0.Center(
        child:  Column(
          mainAxisAlignment: prefix0.MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/icon.png"),
            Text("Flash News ",style: 
            TextStyle(color: Colors.black, fontSize: 20,fontWeight: prefix0.FontWeight.bold),
            )
          ],
        )
      ),
      )
      
      
    );
  }
}
/// end of splash screen


class mainHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myHome(),
      
      
    );
  }
}

class myHome extends StatefulWidget {
  @override
  _myHomeState createState() => _myHomeState();
}

class _myHomeState extends State<myHome> with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    controller = new TabController(length: 5, vsync: this);
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // //////// SIDE MENU /////////////
    Widget sideMenu(IconData icon, String title, Color color){
      return ListTile(
                leading: Icon(icon,color: color,),
                title: Text(title,style: TextStyle(fontSize: 18),),

              );
    }
    return Scaffold(
      
      drawer: Drawer(
        
        child: ListView(
          children: <Widget>[
            
            // UserAccountsDrawerHeader(
            //   currentAccountPicture: Image.asset("assets/images/flash2.jpg"),
            //   accountEmail: Text("email"),
            //   accountName: Text("username"),

            //   ),
            Container(
              color: Colors.blueAccent,
              height: 210,
              child:Column(children: <Widget>[
                Image.asset("assets/images/drawer_image.png",height: 150,) ,
               InkWell(child: ListTile(leading: Text("We give the latest news ",
               style: TextStyle(color: Colors.white),
               ),),)
               
              ],)
              ),
            
            InkWell(
              child: sideMenu(Icons.home, "Home", Colors.blueAccent),
              onTap: (){
          prefix0.Navigator.pop(context);
               controller.index = 0;
             
              

              },
            ),
             InkWell(
              child: sideMenu(Icons.contact_phone, " Contact us", Colors.blueAccent),
              onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>ContactPage()));

                
              },
            ),

             InkWell(
              child: sideMenu(Icons.find_replace, "Advertise Here", Colors.blueAccent),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>AdvertPage()));
                
              },
            ),

            // InkWell(
            //   child: sideMenu(Icons.radio_button_checked, " Support", Colors.blueAccent),
            //   onTap: (){
                
            //   },
            // ),
            //  OutlineButton(
            //    color: Colors.blueAccent,
            //   child: Text("Register"),
            //   onPressed: (){
            //   Navigator.pop(context);
            // },),


            OutlineButton(
              child: Text("Close"),
              onPressed: (){
              Navigator.pop(context);
            },),
            
            Container(
              margin: EdgeInsets.only(left: 10.0,top: 30),
              
              
              child:Column(children: <Widget>[
                Text("Designed by Lucky Amos"),
                Row(
                  mainAxisAlignment: prefix0.MainAxisAlignment.center,
                  children: <Widget>[
                  
                   InkWell(
                     child: Image.asset("assets/images/whatsapp.png",width: 120,),
                
                onTap: () async{
                   int phone = 2348163237441;
              var whatsappUrl = "whatsapp://send?phone=$phone";
                  await url.launch(whatsappUrl);
                }
              ),

               InkWell(
                     child: Image.asset("assets/images/facebook.png",width: 50,),
                
                onTap: () async{
                 final urli =
      "https://web.facebook.com/amos.chibex.lucky";
  if (await url.canLaunch(urli)) {
    await url.launch(urli,forceSafariVC: false);
  } else {
    throw 'Could not launch $urli';
  }
                }
              )
                
                ],)
              ],)
              )

            // InkWell(
            //   child: sideMenu(Icons.face, "Gossip News", Colors.blueAccent),
            //   onTap: (){
                
            //   },
            // ),

        ],),
      ),

      
      appBar: AppBar(
        bottom: TabBar(
          isScrollable: true,
          controller: controller,
          tabs: <Widget>[
            Tab( child: Text("Home"),),
           
            Tab(child: Text("Trending"),),
             Tab(child: Text("Celebrity News"),),
           Tab(child: Text("Sports News"),),
            Tab(icon: Text("Gossips")),
          ],
          ),
        
        
        actions: <Widget>[

        ],

        title:Row(children: <Widget>[
          Image.asset("assets/images/icon.png"),
           Text("Flash News"),
        ],)
        ),

        body: TabBarView(
          controller: controller,
          children: <Widget>[
          HomePage(),
          Trending(),
            CelebrityPage(),
           
           FootballPage(),
           GossipsPage(),
           
          ],
          )
      
    );
  }
}