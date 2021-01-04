import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:luckyblog/details.dart';
import 'package:luckyblog/loadingPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List> getPosts()async{
    var response = await  http.get("https://luckyblog.ocashup.com/home.php");
    return jsonDecode(response.body);
  }
  @override
  Widget build(BuildContext context) {
   
                          
    
    return Container(
      child: FutureBuilder<List>(
        future: getPosts(),
        builder: (context,snapshot){
          if(snapshot.hasError){
            print(snapshot.error);
          }
          if(snapshot.hasData){
           // print('data');
            return Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.all(10.0),
            child: Posts(list: snapshot.data),
            );
                      }
                      else{
                        return LoadingPage();
                      }
                    } ,
            
                    ),
            
                  
                );
              }


            
            }
            
           

class Posts extends StatefulWidget {
  List list;
  Posts({this.list});

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
   Color iconColor;

    

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list == null?0 : widget.list.length,
      itemBuilder: (context,i){
       

        return Container(
        
        margin: EdgeInsets.only(bottom: 5.0),
          child: Column(

            children: <Widget>[

              InkWell(
                child: Row(
                  children: <Widget>[
                    /// image Container
                    
                    Container(
                    
                      child: Image.network(
                         "https://luckyblog.ocashup.com/images/"+widget.list[i]['featured_image'],
                      width: 130,
                     
                    ),
                    ),

                    /// the other side column
                    /// 
                 Expanded(
                   
                   child: Column(
                     
                     children: <Widget>[
                   Container(
                     padding: EdgeInsets.only(top:0),
                     child: ListTile(
                       // title ///
                       title: Text(widget.list[i]['title'],
                       style: TextStyle(fontWeight: FontWeight.bold),
                       ),
                       subtitle:  Row(
                         /// Categ
                         children: <Widget>[
                         Padding(padding: EdgeInsets.only(top:50.0),),
                    //  Expanded(
                    //     /// Category
                    //    child: Text(widget.list[i]['category']),
                    //    ),
                       Expanded(
                          /// views with icon
                         child: Row(
                           children: <Widget>[
                             Icon(Icons.remove_red_eye,color: Colors.grey,),
                             Padding(padding: EdgeInsets.only(left:12.0),),
                             Text(widget.list[i]['views']),

                         ],)
                         ),
                          /// date
                           Text(widget.list[i]['home_date'])
                     
                    ],),
                     )
                   ),
                 
                     ]
                 
                  ),
                  )

                    
                ],
                ),

                onTap: (){
               Navigator.push(context, MaterialPageRoute(
                 builder: (BuildContext)=>Details(
                   id:widget.list[i]['id'], 
                   category: widget.list[i]['category'],
                   date: widget.list[i]['details_date'],
                   imageName: widget.list[i]['featured_image'],
                   title: widget.list[i]['title'],
                   views: widget.list[i]['views'],
                   description: widget.list[i]['description'],
                   body:widget.list[i]['body'] ,
                   )
                 )
                 );
                },
              ),
           
               Divider(
                       indent: 5.0,
                      )
            ],
          ),
        );
                      
         },
                            
         );
     }
}

