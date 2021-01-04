import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'loadingPage.dart';

class Comments extends StatelessWidget {
  
 
  String postId;
  Comments({this.postId});

   theComments(){
      http.post("https://luckyblog.ocashup.com/getcomments.php",
                                 body: {
                                   'postId' : postId,
                                  
                                 }) ;
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
     
      appBar: AppBar(
        centerTitle: true,
        title: Text("Comments "),
        ),
        body: commentBody(postId: postId,),
      
    );
  }
}
class commentBody extends StatefulWidget {
 
  String postId;
  commentBody({this.postId});
  @override
  _commentBodyState createState() => _commentBodyState();
}

class _commentBodyState extends State<commentBody> {
  Future<List> getComments()async{
    var response = await  http.get("https://luckyblog.ocashup.com/getcomments.php?postId="+widget.postId);
    return jsonDecode(response.body);
  }
   bool showCommentBox = true;
  bool hasCommented = false;
  bool hasTyped = false;
   String name;
  String comment;
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  
   Color hasTypedColor = Colors.grey;
   changeColor(){
     if(hasTyped){
       setState(() {
         hasTypedColor = Colors.blueAccent;
       });
     }
     else{
       setState(() {
         hasTypedColor = Colors.grey;
       });
     }
   }
  @override
  Widget build(BuildContext context) {
    return //SingleChildScrollView(
        
      
       Container(
       

       width: MediaQuery.of(context).size.width * 1,
       
        padding: EdgeInsets.all(15.0),
        child: Column(
          
          children: <Widget>[
        
               Expanded(
                 child: 

                  FutureBuilder<List>(
        future: getComments(),
        builder: (context,snapshot){
          if(snapshot.hasError){
            print("Errro");
          }
          if(snapshot.data.toString() == "[]"){
            return  Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.all(10.0),
            child:Column(children: <Widget>[
               Text("No Comment yet on this Post!!!"),
               Text("Be the fist to leave a comment ❤️👍"),
            ],)
            );
          }
          if(snapshot.hasData){
           // print('data');
            return Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.all(0.0),
            child: showComments(list: snapshot.data),
            );
                      }
                      else{
                       
                        
                        return LoadingPage();
                  //  setState(() {
                  //       showCommentBox = false;
                  //     });
                        
                      }
                    } ,
            
                    ),
        
        
                
               ),

/// comment box 
           Material(
                  
                  borderRadius: BorderRadius.circular(12.0),
                  elevation: 8.0,
              
                  color: Colors.white,
              
                  //alignment: Alignment.bottomCenter,
                  child: Container(
                   // alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.all(12.0),
                    
                    width: MediaQuery.of(context).size.width * 0.9,
                    
                    child: Form(
                      key: _key,
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                        
                        children: <Widget>[

                           hasCommented?                            Text(
                             "Successful",
                             style: TextStyle(
                               color: Colors.greenAccent,),
                             textAlign:TextAlign.center
                             ):Text(""),
                           
                        

                           TextFormField(
                             minLines: 1,
                             maxLines: 1,
                             
                                
                                  decoration: InputDecoration(
                                    labelText: "Name (Optional)",
                                    border: OutlineInputBorder()
                                   ),
                                   onSaved: (input){
                                   setState(() {
                                       name = input;
                                   });
                                   },
                                 
                                ),

                          Row(
                            children: <Widget>[
                              Expanded(
                                child: TextFormField(
                                  minLines: 3,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    labelText: "Write a comment ...",
                                   // border: OutlineInputBorder()
                                   ),
                                   onSaved: (input){
                                     comment = input;
                                   },
                                   validator: (input){
                                     if(input.length < 2){
                                       return "Comment is too short";

                                     }
                                   },
                                   onChanged: (input){
                                     if(!input.isEmpty){
                                      setState(() {
                                      
                                        hasTyped = true;
                                         changeColor();
                                       
                                      });
                                     }
                                     else{
                                       setState(() {
                                         hasTyped = false;
                                          changeColor();
                                       });
                                     }
                                   },
                                ),
                                ),
                                IconButton(
                                  alignment: Alignment.bottomLeft,
                                  icon: Icon(Icons.send, color: hasTypedColor,),
                                  onPressed: (){
                                  
                                  if(_key.currentState.validate()){
                                    _key.currentState.save();
                                     http.post("https://luckyblog.ocashup.com/postcomments.php",
                                   body: {
                                     'postId' : widget.postId,
                                     'comment' : comment,
                                     'name' : name

                                   }) ;
                                  }
                                  setState(() {
                                  
                                   hasCommented = true;
                                  });
                                  setState(() {
                                    
                                  });

                                  _key.currentState.reset();
                                  
                                  },
                                  
                                  )

                          ],),
                        ],
                      ),
                    ),

                  ),
              ),
             
              /// when its loading
// end of textbox
            
       




              
               ///// comment field 
               ///
              
             

            ],
            )

        
        );
   // );
   
      
      
    
  }
}

class showComments extends StatefulWidget {
  List list;
  showComments({this.list});
  @override
  _showCommentsState createState() => _showCommentsState();
}

class _showCommentsState extends State<showComments> {
  Color  thumbColor1;
   Color  thumbColor;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list == null?0:widget.list.length,
    itemBuilder: (context,i){
      return 
                    Column(
                       children: <Widget>[
                       ///avartar image
                     Row(
                       children: <Widget>[
                         Container(
                   child: CircleAvatar(
                     radius: 30.0,
                     child: Image.asset("assets/images/icon.png"),
                     )
                      
                    ),
                    // profile name
          Container(
           padding: EdgeInsets.only(left:30.0),
              child:   Column(
                    children: <Widget>[
                      Text(widget.list[i]['name'],
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent),
                      ),
                      Text(widget.list[i]['date'],
                      style:TextStyle(color: Colors.grey),
                      )
                    ],),)
                     ],),
                     /// comments

                   Container(
                     //padding: EdgeInsets.only(left:50),
                     child:    Text(widget.list[i]['comment'])
                          
    

                     ),
                     
                     Padding(padding: EdgeInsets.only(top:5,bottom:5),),

                    //  Row(
                    //    mainAxisAlignment: MainAxisAlignment.center,
                    //    children: <Widget>[
                    //      IconButton(
                    //        icon: Icon(Icons.thumb_up,color: thumbColor,),
                    //        onPressed: (){
                    //          setState(() {
                    //            thumbColor = Colors.blueAccent;
                    //            thumbColor1 = Colors.black;
                    //          });
                    //        },
                    //        ),

                    //         IconButton(
                    //        icon: Icon(Icons.thumb_down,color: thumbColor1,),
                    //        onPressed: (){
                    //          setState(() {
                    //             thumbColor = Colors.black;
                    //            thumbColor1 = Colors.redAccent;
                    //          });
                    //        },
                    //        ),


                    //  ],
                    //  ),
                     
                     // divider
                     Divider(),


                    
                     ],
                     );

    },
      
    );
  }
}