import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart' as url;

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  bool showCommentBox = true;
  bool hasCommented = false;
  bool hasTyped = false;
   String name;
    String phone;
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Contact Us"),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
             Container(
               margin: EdgeInsets.only(top: 10,left: 20),
               alignment: Alignment.center,
               child: Column(
                 children: <Widget>[
                   Text("Do you wish send us a message?"),
                  //  Text("Click on the WhatsApp icon to chat with us or  "),
                  //   Text(" send us a direct message ")
                 ],
               ),
             ),

               Container(
               margin: EdgeInsets.only(top: 10),
               alignment: Alignment.center,
               child: FlatButton(
                 child:Column(
                 children: <Widget>[
                   Image.asset("assets/images/whatsapp3.png",width: 200,),
                   
                   

               ],) ,
               onPressed: ()async{
                
                   int phone = 2348163237441;
              var whatsappUrl = "whatsapp://send?phone=$phone";
                  await url.launch(whatsappUrl);
               

               },
                 )
             ),

             Column(children: <Widget>[
               Padding(padding: EdgeInsets.only(top: 20),),
               Text("OR",style: TextStyle(fontSize: 25),),
               Text("Send us a direct message using the contact form below")

             ],),
             Divider(
               
               thickness: 2.0,
             
             ),
              Material(
                  
                  borderRadius: BorderRadius.circular(12.0),
                  elevation: 8.0,
                
                  color: Colors.white,
                
                  //alignment: Alignment.bottomCenter,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.all(12.0),
                    
                    //width: MediaQuery.of(context).size.width * 0.9,
                    
                    child: Form(
                      key: _key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        
                        children: <Widget>[
                          hasCommented?Text(
                             "Successful",
                             style: TextStyle(color: Colors.greenAccent,),
                             textAlign:TextAlign.center
                             ):Text(""),

                           TextFormField(
                             minLines: 1,
                             maxLines: 1,
                             
                                
                                  decoration: InputDecoration(
                                    labelText: "Name (optional)",
                                    border: OutlineInputBorder()
                                   ),
                                   onSaved: (input){
                                   setState(() {
                                       name = input;
                                   });
                                   },
                                 
                                ),
                                Padding(padding: EdgeInsets.symmetric(vertical: 10),),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                             minLines: 1,
                             maxLines: 1,
                             
                                
                                  decoration: InputDecoration(
                                    labelText: "Phone number (optional)",
                                    border: OutlineInputBorder()
                                   ),
                                   onSaved: (input){
                                   setState(() {
                                       phone = input;
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
                                    labelText: "Write a message ...",
                                    
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
                                     http.post("https://luckyblog.ocashup.com/luckyblog/contact.php",
                                   body: {
                                     'phone' : phone,
                                     'message' : comment,
                                     'name' : name

                                   }) ;
                                  }
                                  setState(() {
                                  
                                   hasCommented = true;
                                  });

                                  _key.currentState.reset();
                                  
                                  },
                                  
                                  )

                          ],),
                        ],
                      ),
                    ),

                  ),
                )

          ],),
        ),
    );
  }
}