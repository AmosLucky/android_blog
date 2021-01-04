import 'package:flutter/material.dart';
import 'package:luckyblog/drawerpages/paymentPage.dart';

class AdvertPage extends StatefulWidget {
  @override
  _AdvertPageState createState() => _AdvertPageState();
}

class _AdvertPageState extends State<AdvertPage> {
  String hint = "Select suitable Ad type";
  String email;
  String amount;
  GlobalKey<FormState> _Key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Advertise With Us"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width*99,
                padding: EdgeInsets.all(10),
                child: Column(
                children: <Widget>[
                  Text("Our advert rates are flexible and affordable to help you reach your advert goals at a cheap rate.",
                  style: TextStyle(fontSize: 16),
                  ),
                  Text("kindly choose the advert type most suitable for your promotion and proceed to make payment.",
                   style: TextStyle(fontSize: 16),
                   ),
                  Text("Leaderboard Banner Ad - 728x90  = N1,000 (per day)",
                   style: TextStyle(fontSize: 16),
                   ),
                  Text("Side Bar Ad Banner - 300x250  = N500 (per day)", 
                  style: TextStyle(fontSize: 16),
                  ),
                  Text("Footer Banner Ad - 720x90  = N500 (per day)",
                   style: TextStyle(fontSize: 16),
                   ),
                  Text("Skyscrapper Banner Ad - 120x600  = N7,000 (per day)",
                   style: TextStyle(fontSize: 16),
                   ),
                  Text("NOTE 1: All Banner Ads display on all pages on Wakanda Nation.",
                   style: TextStyle(fontSize: 16),
                   ),
                  Text("NOTE 2: Irrespective of the advert type you choose, minimum advert placement amount is N3,000.",
                   style: TextStyle(fontSize: 16),)

              ],
              ),
              ),

Material(
  elevation: 12.0,
  shadowColor: Colors.grey,
  child:   Container(
  
    
  
    width: MediaQuery.of(context).size.width * 99,
  
    padding: EdgeInsets.all(15),
  
    child:  Column(
  
      children: <Widget>[
  
        new DropdownButton<String>(
  
                      hint: Text(hint),
  
        items: <String>[
  
          'Leaderboard Ad = N1,000(per day)',
  
          ' SideBar Ad = N1,000(per day)',
  
           'Footer Ad = N500(per day)', 
  
           'Skyscrapper Ad = N7,000(per day)',
  
            
  
            ].map((String value) {
  
          return new DropdownMenuItem<String>(
  
            value: value,
  
            
  
            child: new Text(value),
  
          );
  
        }).toList(),
  
        onChanged: (String value) {
  
        setState(() {
  
          hint = value;
  
        });
  
        },
  
  ),
  
  Form(
  
    key: _Key,
  
    child: Column(
  
    children: <Widget>[
  
      Row(children: <Widget>[
  
        Text("₦",style: TextStyle(fontSize: 19),),
  
        Padding(padding: EdgeInsets.only(left:20),),
  
        Expanded(child: TextFormField(
  
        maxLines: 2,
  
        keyboardType: TextInputType.number,
  
        decoration: InputDecoration(
  
          contentPadding: EdgeInsets.only(left:4.0),
  
          labelText: "Enter amount (min of 3000)",
  
          
  
  
  
        ),
  
        validator: (input){
  
          if(input.length < 1){
  
            return "Write an amount to deposite";
  
          }
  
          if(int.parse(input) < 3000){
  
            return "You cant choose amount less than N2000";
  
          }
  
           
  
        },
  
        onSaved: (input){
  
          amount = input;
  
        },
  
  
  
      )
  
  ,)
  
      ],),
  
  
  
      TextFormField(
  
        
  
        keyboardType: TextInputType.emailAddress,
        maxLines: 2,
  
        decoration: InputDecoration(
  
          contentPadding: EdgeInsets.only(left:40.0),
  
          labelText: "Enter contact email",
  
          
  
  
  
        ),
  
        validator: (input){
  
          if(input.length < 1){
  
            return "This field must no be empty";
  
          }
  
          if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(input)){
  
            return "Invalid email";
  
          }
          if(hint == "Select suitable Ad type"){
            return "Please select the suitable Ad type above";
          }
  
           
  
        },
  
        onSaved: (input){
  
          email = input;
  
        },
  
  
  
      ),
  
  
  
      RaisedButton(
  
        color: Colors.blueAccent,
  
        textColor: Colors.white,
  
        child: Text("Continue"),
  
        onPressed: (){
  
          if(_Key.currentState.validate()){
  
            _Key.currentState.save();
  
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>payPage(
  
              amount: int.parse(amount),
  
              subscriptionType : hint,
              email : email
  
              )));
  
  
  
  
  
          }
  
  
  
        },
  
        )
  
  ],),)
  
      
  
      
  
      
  
      ],
  
    ),
  
    ),
)



          ],
          ),
        ),
        
      
    );
  }
}