import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:flutter/material.dart';

import 'package:luckyblog/comments.dart';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  
  String id;
  String category;
  String imageName;
  String title;
  String description;
  String date;
  String views;
  String body;

  Details({this.id,this.category,this.imageName,this.date,this.description,this.title,this.views,this.body});
  

  
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Color favouriteColor;
  @override
  Widget build(BuildContext context) {
    void addView(){
    var url = "https://luckyblog.ocashup.com/views.php";  
    http.post(url,body: {
      "postId" : widget.id,

    });
  }
  addView();
    

  
    return Scaffold(
  
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: (){
              Navigator.push(
                context, MaterialPageRoute(builder: ( BuildContext)=>Comments(postId: widget.id)));
           
            },
              icon: Icon(Icons.add_comment,)

          ),
          IconButton(
            icon: Icon(Icons.favorite,color: favouriteColor,),
            onPressed: (){
              setState(() {
                favouriteColor = Colors.redAccent;
              });
            },
          )
        ],
        title: Text(widget.category),
        ),
        

        body: 
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                Image.network( "https://luckyblog.ocashup.com/images/"+widget.imageName,
                ),
                
                Container(
                  margin: EdgeInsets.only(top:8.0,left: 12,right: 10),
                  width: MediaQuery.of(context).size.width * 0.99,
                 
                  child: Column(
                    
                    children: <Widget>[
                      // title
                      Text(widget.title ,
                      
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                      ),
                      //red eye container

                      Container(
                        margin: EdgeInsets.only(top:12,bottom:12,left: 12),
                        child: Row(children: <Widget>[
                        Text(widget.date,
                        style: TextStyle(color: Colors.grey),
                        ),
                        Padding(padding: EdgeInsets.only(left:40.0,),),
                        Icon(Icons.remove_red_eye, color: Colors.grey,),
                         Padding(padding: EdgeInsets.only(left:10.0,),),
                        Text(widget.views,
                         style: TextStyle(color: Colors.grey),
                         )
                      ],),
                      ),

                      // descripyion

                      Container(
                        margin: EdgeInsets.only(bottom:12.0,),
                        child: Text(widget.description,
                         style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                        ),
                        ///body of the post

                        Divider(thickness: 2.0,),

                        Container(
                          margin: EdgeInsets.only(top:10.0,left: 5),
                          child: Text(widget.body ,
                          style: TextStyle(fontSize: 17,),
                          ),
                          ),

                           Divider(thickness: 2.0,),

                        Container(
                          margin: EdgeInsets.only(top:8.0),
                          child: Column(
                            children: <Widget>[
                             Container(
                               margin: EdgeInsets.only(bottom:12.0),
                               child: prefix0.RaisedButton(
                                 textColor: Colors.white,
                                 color: Colors.blueAccent,
                                 child:  Text("View Comments",
                               style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                               ),
                               
                               onPressed: (){
                                   Navigator.push(
                context, MaterialPageRoute(builder: ( BuildContext)=>Comments(postId: widget.id)));
                               },
                               ),
                               
                               
                               
                               
                               ),
                               
                              

                          

                          ],),
                          ),
                          
                           

                ],
                ),
                ),
                  //GetPosts(url: "http://192.168.43.135/luckyblog/home.php",), 
            ],
            ),
            ),
            
        

       

floatingActionButton: 
   prefix0.CircleAvatar(
     
     child: IconButton(
       
  icon: Icon(Icons.share),
  tooltip: "Share",
  
  onPressed: ()async{
    
      
      
      var response = await FlutterShareMe().shareToWhatsApp(
        
        msg: widget.title  + " \n " +   widget.body.substring(0,100) +
        " ... Read More, \n Download Flash News App from PlayStore"
        );
                  if (response == 'success') {
                    print('navigate success');
                  }
                  else{
                    prefix0.Navigator.pop(context);
                  }


  },
  ),
   ),

 
      );
  }
}
